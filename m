Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F61F92E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 02:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759975876; cv=none; b=C7Y8x2srrq56sD/iHwE5zrtOxrI7EuNIxne3Qh/hqb2+aIXMF2Gdd5ITrzSwSnTseZxyXZQ36ltyKcWt+UAo5iarnicyiOHaof/w9V+R6hV+J8RmtWwa/nbK89jlb8wZSLF9XfBgOqMe72u6viTgISNlcO74yRULubzp9klWu30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759975876; c=relaxed/simple;
	bh=kgME5ptW1dqdCof7hUAc4atSggk3hpL5EXsqgxkuxE8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gheq38zmib9yh9/wci3dsZ7U1+Ow2zHYayfLHVtiaa15y5eI4gxvc8yLdJ8xPuqGMbP3/Feix71wwOl38gVrG3QayId987PO3s5OlesHaQDIRkV3KT65IGp5ardCrbA6Aqlal5peQ3dtEeViACR2j6y63CiMfMnXU99rx/c9vzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13D9040E60
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 02:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.59
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoKlEaNTrb8b for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 02:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.40.44.13; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC628405BE
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC628405BE
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CC628405BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 02:11:12 +0000 (UTC)
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 6A72511B05F;
	Thu,  9 Oct 2025 02:11:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 3329317;
	Thu,  9 Oct 2025 02:11:08 +0000 (UTC)
Date: Wed, 8 Oct 2025 22:11:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] ring buffer: Propagate __rb_map_vma return value to
 caller
Message-ID: <20251008221109.13a76717@batman.local.home>
In-Reply-To: <20251008172516.20697-1-ankitkhushwaha.linux@gmail.com>
References: <20251008172516.20697-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3329317
X-Stat-Signature: xdxfbmni5s9m7wmz3r6r6ykqnwrdfn6n
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+wjdxel8B/+3U+KgtzPA4RWU9GRqZrXQw=
X-HE-Tag: 1759975868-468936
X-HE-Meta: U2FsdGVkX1+0PJKh53Jx2MaGLnolId+sXJMvyZb+FL+QQA0rIWT4L7RlFdXxqmNUOYpNCnw09sdvDlJnLe7bcskrmdGyzwn7uaxR34qZjxbpyGssszRO7im41awd3O2M2YST6lPgcuVv5qhfDhicCjCir7xI0Fic+vD/y6E1fyuC6O3kciGEEgU1CbxtbLjT0GZWFC1gIkgm9nktSb5vJtxzVNI+WMMkotfr3kxrYikrP5jpApdOLU9r2gRaitELDBaie833I8rR2cfYZcy8P4053/OAlQbtX6F5XwLN7kX1MffsuNMSvCvxD8dbzdaDzrHCbc1vO0mft1GsBmTM+AOtRHTxhOt4BY3G8IDbQyT8elvfSPtI7z64W1LzpuXsR65xDA2B3Yok2h/NR4AGtw4JgqK/gAAVv2BZJmu8OQLpmi+oKkjvpsJUv0Vpu5HyUExWH3j/SohmBuJzKyW/+XfrwCcVu2TXePXxo6rBs24=

On Wed,  8 Oct 2025 22:55:16 +0530
Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> wrote:

> The return value from `__rb_map_vma()`, which rejects writable or
> executable mappings (VM_WRITE, VM_EXEC, or !VM_MAYSHARE), was being
> ignored. As a result the caller of `__rb_map_vma` always returned 0 
> even when the mapping had actually failed, allowing it to proceed
> with an invalid VMA.
> 
> Reported-by: syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?id=194151be8eaebd826005329b2e123aecae714bdb
> Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
> 

Thanks for the update.

> Changes in v2:
> * applied minor cleanup suggested by Steve in v1

Note, the "changes" should be below the "---" as that prevents it from
being added to the git change log. And it's always good to include a
link to the previous version.

For example:

> 
> ---

Changes in v2: https://lore.kernel.org/linux-trace-kernel/20251007171256.20884-1-ankitkhushwaha.linux@gmail.com/
* applied minor cleanup suggested by Steve in v1

-- Steve


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

