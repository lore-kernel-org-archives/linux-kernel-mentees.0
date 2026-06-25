Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCAF34BA33;
	Thu, 25 Jun 2026 01:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782352138; cv=none; b=mtSO5dT9HD0UZFkLvFMxqmR2XpmPTDXZKOk3MydehKz/I3hWoJnnwS4V6bCyKScQR7ndUe0KzZ90Mn/8x1fHqBEbmoA7HeiK4RqifpQYOx99/5L4XAkyLwpHYc9dknWloIYjkdGAwl1725E5XPs2tmbX0KpkIsRcy1AkvgoWz0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782352138; c=relaxed/simple;
	bh=03Qkj23IKhdMbQju9/u3SWj+fuxPaGWJGEwwgS2WXVw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Rsn8ykyHYcZ7jGp50ctHJHqGAmrIFxrjcXgBuZ4aUZjEWSaknKdm/3Raw2K+961tjCETQprvTnAKqTdQiXBmFFIKpz2Ylp6pz1uZ9zdhpp4aha6Pb+iDL6Ax2dW2QoGr3PrnqKw+AO73KkNhXUSo/iW2y6tuNGIIevhiPQjcjjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Gt/rYUi4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Gt/rYUi4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341791F000E9;
	Thu, 25 Jun 2026 01:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782352137;
	bh=eaw6Jpmx0iTU5ok6S+y/E1c+JF1d6MfBmwaE/SiApvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Gt/rYUi41/ADyWCLCH4RZTz2Ti7dZJUzkYluG5rszO4nG6IxcZjxK2wKI3kqxG6bI
	 GgAT+8MZrvfl4Pij8t1OxC4ZJBh8i4PVRHAP6gq6L4v1PA/IDnArn4yiQq+osnsS0G
	 oEZbQlAaUOTzkuxuQ2d8MMzixnFV234reFgxciSg=
Date: Wed, 24 Jun 2026 18:48:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jakov Novak <jakovnovak30@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Vlastimil Babka
 <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Hao Li
 <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes
 <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH] Docs/mm: fix documentation warning for GFP parameter in
 kmalloc_obj, kmalloc_objs and kmalloc_flex
Message-Id: <20260624184856.55fe055b85e17ed2c6572182@linux-foundation.org>
In-Reply-To: <20260619113622.11712-1-jakovnovak30@gmail.com>
References: <20260619113622.11712-1-jakovnovak30@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Jun 2026 13:36:22 +0200 Jakov Novak <jakovnovak30@gmail.com> wrote:

> Subject: [PATCH] Docs/mm: fix documentation warning for GFP parameter in kmalloc_obj, kmalloc_objs and kmalloc_flex

Thanks.

"mm/slab: ..." would be a better subject.

> Date: Fri, 19 Jun 2026 13:36:22 +0200
> X-Mailer: git-send-email 2.54.0
> 
> Compiling the documentation currently gives the errors:
> 
> WARNING: ./include/linux/slab.h:1100 Excess function parameter 'GFP' description in 'kmalloc_obj'
> WARNING: ./include/linux/slab.h:1112 Excess function parameter 'GFP' description in 'kmalloc_objs'
> WARNING: ./include/linux/slab.h:1127 Excess function parameter 'GFP' description in 'kmalloc_flex'
> WARNING: ./include/linux/slab.h:1100 Excess function parameter 'GFP' description in 'kmalloc_obj'
> WARNING: ./include/linux/slab.h:1112 Excess function parameter 'GFP' description in 'kmalloc_objs'
> WARNING: ./include/linux/slab.h:1127 Excess function parameter 'GFP' description in 'kmalloc_flex'
> 
> This effectively omits the GFP parameter from the current kernel
> documentation. This patch marks the "..." parameter with the previous
> description of the GFP parameter along with an "optional" tag in
> parantheses.

"parentheses".

I'll assume that Vlastimil will be processing this patch.
