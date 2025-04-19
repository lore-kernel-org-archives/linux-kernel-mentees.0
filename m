Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E375A136E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 02:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745030763; cv=none; b=Rg+Hv6Ab5wf+rwFH0HgMQD3577B3ByXP3MChLZtWuEnB+OGWT0tNo8Td6Iaigxx+WXduDbaWVRedDrUm8+gyQ3emOBcBsBpocF/7Rm52BKjmUHwzmLo4JuJii1fvwnycsRCCDHQPnZbIoz7PA2cmpktHi+LvrT9eoW/kvDH/pMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745030763; c=relaxed/simple;
	bh=NoCw7J1EIepitFB4PWj8H+u0JsHKxU09lVRrOlawf1c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ruxjP0WHturu6uFMcbd5g98EgvFRIZRDENPJtxm+SCGxeGFk2IORDz3TnQLAHNBwcTRfjqpNegqgbh30vCS5n5oZWUJIV9UuIX259dbLoWBk3Jz6oeVycDhI+Cx1TjOga40axe7GUzuLCg6FHDDLzLmP33NmsZh3hg5GnwAv55c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E75040550
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 02:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.651
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RiDoslIY4eu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Apr 2025 02:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=/h1u=xf=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAC9B40545
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAC9B40545
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EAC9B40545
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 02:45:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24C50A4B623;
	Sat, 19 Apr 2025 02:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08614C4CEE2;
	Sat, 19 Apr 2025 02:45:56 +0000 (UTC)
Date: Fri, 18 Apr 2025 22:45:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v4] tracing: Replace deprecated strncpy() with strscpy()
 for stack_trace_filter_buf
Message-ID: <20250418224555.5b8b8232@batman.local.home>
In-Reply-To: <20250418221443.1067938-1-devaanshk840@gmail.com>
References: <20250418221443.1067938-1-devaanshk840@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Apr 2025 03:44:41 +0530
Devaansh Kumar <devaanshk840@gmail.com> wrote:

> diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
> index 14c6f272c4d8..0f2253f3bc8c 100644
> --- a/kernel/trace/trace_stack.c
> +++ b/kernel/trace/trace_stack.c
> @@ -542,7 +542,7 @@ static __init int enable_stacktrace(char *str)
>  	int len;
> =20
>  	if ((len =3D str_has_prefix(str, "_filter=3D")))
> -		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
> +		strscpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_b=
uf));

Is the sizeof() needed?

=46rom include/linux/string.h:

/**
 * strscpy - Copy a C-string into a sized buffer
 * @dst: Where to copy the string to
 * @src: Where to copy the string from
 * @...: Size of destination buffer (optional)
 *
 * Copy the source string @src, or as much of it as fits, into the
 * destination @dst buffer. The behavior is undefined if the string
 * buffers overlap. The destination @dst buffer is always NUL terminated,
 * unless it's zero-sized.
 *
 * The size argument @... is only required when @dst is not an array, or
 * when the copy needs to be smaller than sizeof(@dst).
 *
 * Preferred to strncpy() since it always returns a valid string, and
 * doesn't unnecessarily force the tail of the destination buffer to be
 * zero padded. If padding is desired please use strscpy_pad().
 *
 * Returns the number of characters copied in @dst (not including the
 * trailing %NUL) or -E2BIG if @size is 0 or the copy from @src was
 * truncated.
 */
#define strscpy(dst, src, ...)  \
        CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS=
__)

With stack_trace_filter_buf defined as:

  static char stack_trace_filter_buf[COMMAND_LINE_SIZE+1] __initdata;

This looks like a text book example of just having that be:

		strscpy(stack_trace_filter_buf, str + len);

-- Steve


> =20
>  	stack_tracer_enabled =3D 1;
>  	return 1;
