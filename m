Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846D743847F;
	Fri, 31 Jul 2026 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522343; cv=none; b=Ljnr8v+7t3/F6SSlVRWoeG1tlvyUWGdazEThS2zp0jUK2Cz3IRaAsm3AnsNwreHTEg3Kuy2jh0ZYbYru2lJmewOf/ZlSmaw4afBKkAzrC5Uum6qYQRunRM4AHMIj2q0nCzJ04p1y5Kosxo7DXQ81qyJQ/l4LuFKyFNxFIKY/dYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522343; c=relaxed/simple;
	bh=YFbSz30kPcx78155vJTAsk1OQpe9u58eLQURDQKcnw8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oEusZeEw8ym5mINtS3qEtblgVh39bZYmNCAn9gsvLG4C9Za+ihANkUv6GPXRXBPtlXXQcEo+Or07fSt1RavMIAh/TEpM190es4AWBRUZdgFkqQeonMFh5qAG8ecMgaO93qPAas04Qri31vsC5Mj/A57M69BTmkPRrXq2uDYsiXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eTH+JeyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eTH+JeyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F5E1F00AC4;
	Fri, 31 Jul 2026 18:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785522342;
	bh=4n5dbvA0+vX+AHOmVHzfOZ4kB7eze3wEWZu9Bo3HESs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eTH+JeyKhRO+vLnHWTdX17PA3TtGas2fFriy/V6a5UVDkCdwKuqPRQsBu2DcGufPV
	 MXEC2Q2dtveqxUPRW3+bOjnNVQIuRRVN0hGae4Tz7V8SsMDbS+uypZCzs7ei59F/c+
	 SWRe04RbqrXEFBBVCd5ngbdS5DGKoE7nFsFJPII4=
Date: Fri, 31 Jul 2026 11:25:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Jakov Novak <jakovnovak30@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, David
 Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "\\  Liam R . Howlett \\ " <liam@infradead.org>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3] mm/khugepaged: replace mutex_lock/mutex_unlock usage
 with guard macro
Message-Id: <20260731112541.6098017d442451a8b54345ec@linux-foundation.org>
In-Reply-To: <amx5XdMQ7S_krjNA@pedro-suse>
References: <20260730204724.16912-1-jakovnovak30@gmail.com>
	<amx5XdMQ7S_krjNA@pedro-suse>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Jul 2026 11:33:47 +0100 Pedro Falcato <pfalcato@suse.de> wrote:

> On Thu, Jul 30, 2026 at 10:47:24PM +0200, Jakov Novak wrote:
> > Currently, khugepaged locks the khugepaged_mutex in two functions:
> > start_stop_khugepaged and khugepaged_min_free_kbytes_update. Remove
> > mutex_lock/mutex_unlock usage in these functions and replace it with the
> > guard macro. This makes the code more readable (removing a goto statement)
> > and makes it harder to introduce bugs in the future.
> > No functional changes introduced.
> > 
> > Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> 
> Hmm, did Andrew actually give this R-b tag out? I can't find it on-list. 

I don't think so.  Hallucination ;)

I do sometimes sneak in an offlist R-b when I'm looking at things but
I'm pretty inconsistent and lazy about it.

<looks at it again>

Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
