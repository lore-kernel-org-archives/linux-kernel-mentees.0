Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03D310957
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Oct 2025 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759940144; cv=none; b=S1T1ST3JPz6Qq10ykOkqqGN1s87N4elI7OOFOdu4dcuqA7BgWf9FFjkKSlcBYbSBNgYkaqKlU/Ab4pjkoptpyliKVO6Lg5wS6KG8KV3STWvXNeWRSSekTa1HTEcIcliCmei43zJWO6tl9Vvx02Jtc3He5F6iXNdgZKSaMVCzPeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759940144; c=relaxed/simple;
	bh=7qG9+11u3mCpiyNEifUFS7i/al/DnxnwuP9mz9DKpxA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTBn2AfQLSWMA72uK7NFaR7Ka32+8hJqknaVYRdHCC3+22XdFvCYxXdvFQLNUu8f7/uR4nYPb+8GPxNx0+gvc44Eox6tZpraQ/lXm03jUS7RSGfY653pMOl7WoMRxR9S5btW2ohrVt1zoZhkV0XWew42j+Fow/g48L9yY62KaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F98840B3D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Oct 2025 16:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.59
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjPBdpeqvvJ5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Oct 2025 16:15:41 +0000 (UTC)
X-Greylist: delayed 379 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 08 Oct 2025 16:15:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2789840B3B
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2789840B3B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.40.44.14; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=<UNKNOWN> 
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2789840B3B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Oct 2025 16:15:40 +0000 (UTC)
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 36FE71A05EE;
	Wed,  8 Oct 2025 16:09:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 012A520016;
	Wed,  8 Oct 2025 16:09:16 +0000 (UTC)
Date: Wed, 8 Oct 2025 12:11:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
Subject: Re: [PATCH] ring buffer: propagate __rb_map_vma return value to
 caller
Message-ID: <20251008121110.4e7c3671@gandalf.local.home>
In-Reply-To: <20251007171256.20884-1-ankitkhushwaha.linux@gmail.com>
References: <20251007171256.20884-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 012A520016
X-Stat-Signature: drgddpbyrfrhq5xtite7umqbhqhkufe1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18o0hnhvzZVrS/THusq5BDX3T986j69cyg=
X-HE-Tag: 1759939756-70540
X-HE-Meta: U2FsdGVkX19193Sv84va4CFxLEBUFYDcm2cRgLxlqYnUKTMjNK8HnR/ZYDaveYfvYTb13tR6o6O03VHrvePJNGOBik4UjEa/kSgtkM16OsUV0CgYpFWtaEdFtJzHm2sq4r0F3Aj4pDCcxtLohjoRLW7AKZUAhyjWAfoOUyY3UX4IZgcPwUDOQQu60rdMBUr38EW8wwANmllQR8/FpZQ6gNmMb82nnRq5Oi4DJPxDve/J6lkvBKJY6u5uP2aMh6kAPant6SCmUw9MdhGAzVwzmAygch1lbuzYc2mJwaDrU16c8Ve3fKsxT3KB4H/xQ+lOyNZI+OEBGDb0HJp/a3y+jff8jlzUz21P8cyIf5HMfEBuJcCTsCJDQsqe4GdBc6EpYLOxVnderg5C9qENSbewg1oOsqu8lhTaQRAxxaIzv/P0BlSf9TGi3kyTHW2h51JQByflRNbupKgqoGCfXtcFvQ493Llp9T+UBU8+CMZyesE=

On Tue,  7 Oct 2025 22:42:56 +0530
Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> wrote:

Note, tracing subsystem expects the subject to start with a capital letter:

 ring buffer: Propagate __rb_map_vma return value to caller

> The return value from `__rb_map_vma()`, which rejects writable or
> executable mappings (VM_WRITE, VM_EXEC, or !VM_MAYSHARE), was being
> ignored. As a result the caller of `__rb_map_vma` always returned 0 
> even when the mapping had actually failed, allowing it to proceed
> with an invalid VMA.
> 
> Reported-by: syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?id=194151be8eaebd826005329b2e123aecae714bdb
> Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
> ---
> 
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4ff71af020ae
> 
> ---
>  kernel/trace/ring_buffer.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 43460949ad3f..4efb90364f48 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -7271,6 +7271,8 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
>  		cpu_buffer->subbuf_ids = NULL;
>  		rb_free_meta_page(cpu_buffer);
>  		atomic_dec(&cpu_buffer->resize_disabled);
> +		/* VM failed to be mapped */

No need to add the comment. It's obvious what happened.

> +		return err;

Don't return here.

>  	}
>  
>  	return 0;

Change this to:

	return err;

as after that if statement, err will be 0 on success or the value you want
to return.

-- Steve
