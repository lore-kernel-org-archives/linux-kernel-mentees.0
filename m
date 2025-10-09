Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F52E92D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018272; cv=none; b=ZmPZhkWGKsS9Uu9xBy2ZVYaTCzoJeSQdugOTozdIgJwqB2MLDTfLiQ5V6KB9jW3AFf4qwiu3A4hXoNsqcX05ZJxsaqVZXcvsHvJZUGwogoi8XWv8kYnDgXYCL+rZZVnjRBonQnKRQqgW2MNXoLWWNRM2R1wsMHNGBGIvt+1sal8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018272; c=relaxed/simple;
	bh=wpi1WDWENZNucIqzTCYS/kpzZuHNHMw9EDbF6qY427Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NR2eMP+CrWw7CMlC3s6CK42goSEB6/StjpRdPjL3qAxV0d0l7hD3z1Odc5wZj/eSRpCq58IPC6CvF2F1NxfKdRy8f2K3hf+4htoFnDHPwzv/kvxeEqy2xetjrBwXwdhb0rxHMp74O6sGTDctR4wsr89k1lYlNHG7rTMdqYIM9/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD75F822DE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 13:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.59
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkMczFaFrA9S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 13:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.40.44.15; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98F6A82166
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98F6A82166
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 98F6A82166
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 13:57:49 +0000 (UTC)
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 28C79BBCAB;
	Thu,  9 Oct 2025 13:57:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 123242F;
	Thu,  9 Oct 2025 13:57:44 +0000 (UTC)
Date: Thu, 9 Oct 2025 09:57:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] ring buffer: Propagate __rb_map_vma return value to
 caller
Message-ID: <20251009095744.443db14b@gandalf.local.home>
In-Reply-To: <20251009045345.8954-1-ankitkhushwaha.linux@gmail.com>
References: <20251009045345.8954-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: u7ee89ea1wegxtoyhbphbqe3qeqipj3o
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 123242F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19ssnBb5s9lqxsepWuLpsIvqanHttfzsvU=
X-HE-Tag: 1760018264-251375
X-HE-Meta: U2FsdGVkX18Iw/henf7Qo2umn/CAr5c/XzkBiySzpEon0NEVoVIG5vW+tIUP2E4naPJaGrdpDZZZc+QEK607BVrPoWnJ1tsizgiBrol4D9iKFjxm+KhnJckJjKbKg3huYYOFjHyYJi1dJNhDcV2859S/N0yXYHMESZ/yU+0a9e+fP7G1Eynz/+9ALZJJBdsnS0eXx9Ig5AyV5BqEqaICqfMx+mBakqj6EDorJcrD61Fr2V8EvdMQd+HtyjG+JMrxzsWRX+sqnSiYJZuMyA3DdMrdR56WwY1WlcpEMh2WMuFUNU86xP0PJodahadKnrz9iL+izF1n5H5sEQN0FmwCEbEBEF/WfSffW/OdoihDCZ5bCecxE/EZjbZN+y30jI83mVAhTRVPREaeSIGtCKZjpBU9E13ywhu6VsGC85m3Zt0hlRc21XMjvpppPBr4q6eG6AVeyx4dEWv93wqWGkJK/JymgKP6nRIqOSBaEqLKs9o=

On Thu,  9 Oct 2025 10:23:45 +0530
Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> wrote:

> The return value from __rb_map_vma(), which rejects writable or
> executable mappings (VM_WRITE, VM_EXEC, or !VM_MAYSHARE), was being
> ignored.  As a result the caller of `__rb_map_vma` always returned 0 even when the
> mapping had actually failed, allowing it to proceed with an invalid VMA.
> 
> Reported-by: syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?id=194151be8eaebd826005329b2e123aecae714bdb
> Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
> ---
> 
> Changes in v3: https://lore.kernel.org/linux-trace-kernel/20251008172516.20697-1-ankitkhushwaha.linux@gmail.com/
> * Same as v2:)
> 
> Changes in v2: https://lore.kernel.org/linux-trace-kernel/20251007171256.20884-1-ankitkhushwaha.linux@gmail.com/
> * applied minor cleanup suggested by Steve in v1
> 

This is good practice, but I already pulled in v2.

-- Steve

> ---
>  kernel/trace/ring_buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 43460949ad3f..1244d2c5c384 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -7273,7 +7273,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
>  		atomic_dec(&cpu_buffer->resize_disabled);
>  	}
>  
> -	return 0;
> +	return err;
>  }
>  
>  int ring_buffer_unmap(struct trace_buffer *buffer, int cpu)

