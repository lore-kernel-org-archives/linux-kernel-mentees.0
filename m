Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7112E171D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 19:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="TsJTrrY/"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF5DA40131
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 19:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF5DA40131
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=TsJTrrY/
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.307
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZSEVxjVDHjL
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 12 Nov 2023 19:55:39 +0000 (UTC)
Received: from smtpout.efficios.com (unknown [IPv6:2607:5300:203:b2ee::31e5])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 757B84011B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 19:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 757B84011B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1699818937;
	bh=oUH5yB59vNk6vH5kP/XzAUvhUo0WGNNoDlHhwTnLRmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TsJTrrY/IoeQkMjYQ2d/iUOXhjVAxnV/lby2W6X7YxP0q4DAvIGD3xN/6L17UhN8A
	 6rFsdBreQOnM/E1i3IIy5t9sBDyZnEvfG4vsLcjokDZ3tTu58tFk18Raa7SAWLw5/A
	 skwh1S89OIqUxnEMSwFssjVJMLrUT1S2XXUtYH35KvyCOqQWUfRBSWvWfLMXLGTKxa
	 IojeyOyNsXIYTPXOxLMeKZrZF0S/SLUrk4qxXyNzCwNvj1b0oi2VwkLHLFldxVUlYF
	 Cxf6N67l1nuO4jynLoVca6Iux41gKG6fk1H0UhIpxgEgSPrMVgpnduCBD0WBw7B81G
	 2lZ+yUaggauwQ==
Received: from [172.24.0.4] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4ST3Fh3Chtz1cV8;
	Sun, 12 Nov 2023 14:55:36 -0500 (EST)
Message-ID: <dbe62cc9-8354-463f-b398-8e80ca17e556@efficios.com>
Date: Sun, 12 Nov 2023 14:56:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Fixing directly deferencing a __rcu pointer warning
Content-Language: en-US
To: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com, mjguzik@gmail.com,
 npiggin@gmail.com, peterz@infradead.org, paulmck <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <202311031320.c3ebc782-oliver.sang@intel.com>
 <20231112193055.2072382-1-singhabhinav9051571833@gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20231112193055.2072382-1-singhabhinav9051571833@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-12 14:30, Abhinav Singh wrote:
> This patch fixes the sparse warning with this message
> "dereference of noderef expression" , in this context
> it means about directly dereferencing a pointer tagged
> with __rcu annotation.
> 
> Dereferencing the pointers tagged with __rcu directly should
> always be avoided according to the docs. There is a rcu helper
> function rcu_dereference(...) to use when dereferencing a __rcu
> pointer inside rcu read side critical sections. This function
> returns the non __rcu tagged pointer which can be dereferenced
> just like a normal pointer.
> 
> I tested with `lockdep` enabled, with these config options
> `CONFIG_PROVE_RCU` and `CONFIG_PROVE_LOCKING` enabled and it
> booted just fine. To confirm if lockdep was really enabled
> I found these paths inside the qemu virtual envirnoment.

I did not see actions taken nor answer on those comments:

https://lore.kernel.org/all/CAGudoHEfjSAim6Hh-qYPY+qi8nbLx7J3YdpGgFwSvD7xbeYR3w@mail.gmail.com/

Basically, the missing annotation here can be either:

- A missing rcu_dereference, if the intent is to use the pointer while protecting
   with with a read-side critical section,
- A missing rcu_dereference_protected(), if the use of the pointer is protected by
   a lock.

I don't really care if rcu_dereference happens to work in testing or not. _If_ the
intended design is that this rcu pointer is protected by a lock, or being used before
becoming published elsewhere, then using rcu_dereference to silence the warning is
wrong. (note: I did not do a review of the affected code, but I would expect the
commit message to take care of going through this level of detail)

And the fact that this aspect of the feedback has been hidden under the rug worries
me.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

