Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213517C224
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745054981; cv=none; b=LKcAevuS0yCvWdb4vJ443EssOQMYXQ6apdH0hxR9jSMKbdfa2FLHLCUBRP0zojVM/3zYdiXeve0uVSFb7HApX5OoPOdb9dOtjBneukhzYLRG8oR3f7GDh2S2GN3/4z9ooDGHvWb4w+XvnAuWt53KHPBrPLs1qOUYt6jFBLePgqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745054981; c=relaxed/simple;
	bh=L3jZIvRFT7zN+24GKgD77xybabb7mNcnO1t8/PPFTbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvy2rsedtxuK0UZ6GUMB4uftOC+mLL1bNEF/f5LDGUG72lREVlJ3dvJ4tZuW5SNtNVnLSqmVJUOs4HWK1uPgbVqey5IC6Vs2vFNSGS8z94h+EocZL4x5BHYLRh7XNcZPNlnIOOYIJN+N7YHenb62066W8iG7RKxeNKKo4/Ma/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9VW7zN+; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9VW7zN+"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 773B740686
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 09:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFpUWbhN3y3j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Apr 2025 09:29:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B077440678
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B077440678
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j9VW7zN+
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B077440678
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 09:29:38 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so22892576d6.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Apr 2025 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745054977; x=1745659777; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V4aMm4u8KPovDgrH6Sr7DHo7zVlQ5dKxL0+Timy+s2U=;
        b=j9VW7zN+ref4QAlSFubeBPOmCKKJ2LPVxTse74s31ZetTel5HIYnO5iTLV2O2VCHSs
         cgdEXMRBIoPdG3xMWO8h1Pv16yJ3pf2Uohc2sqH9fcie6RTv55Q4TGx/B3qjIV6ByMI0
         OqnkoPJzr/PFNxc1qolOn3zZshjpafL66i0vtBQdOXlWLQBsrc7o/J8QSa5yHQEuqO+c
         8kvOLItEnJL9PtlMdNsQpE2ipSp+KmysPih/hy8xj+atO0eEItkMI2mpcd+i13ph/wZL
         e4bwvQqW/+eqKRRZSAnbahf2JbaQoJ8VB43O6vpIeC/NntD8DrV1p98rBpSpZcx5qDMw
         9rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745054977; x=1745659777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4aMm4u8KPovDgrH6Sr7DHo7zVlQ5dKxL0+Timy+s2U=;
        b=YUDvs7imDLEAsHcwuPcFNA35L+nIBplYr5qeLGOxaLKH0SSxmODJHAwhnIG/yHd+Zz
         SO5M6NtGUhEiVTazR2EVyuE/zccDTtS8BHO6UyRytqXDYcHRh64dMuEZI/pIaQO/+oDx
         xdzkXTrJw5UNbG816ntaRRMX1AB+uIHxvbMQMuoRi0WaFXRGoE2L+iaon5cxFlka/puM
         q+MOSm7VsF+W782/d+2DYGpOLy/Ra3W6MDhcuwUxWrznCplFA3iWtxouoTAby7EQ5Wgu
         8ZPAUBsrHtvDbCUwyC08YMyIjNIy0N7b1W7yp4UT/kd4zxbgm23jbvE2bDEe7s6NkUEA
         BumA==
X-Forwarded-Encrypted: i=1; AJvYcCVc7C7lVA3Pj3WOE0Mgez1b6pY6xTVFIH1D2AZoro0AIkKwLuwo4l4xunzgcrlRWbodUrpkjocr1nFpN8FnI1KB42sPcg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzBYOLyiFjTbGBae7J14DB6heyr1ZyuzvFF5pctIo6D3R2c//9C
	qU7EaGdhtwlfyyQfsAYlpJNjSnozdBcYyoIA4EK1YuUdPE8g2bSEkA+BJoh4WDZB429rk6uYZDf
	9bEOWStgX/yiKbYwZQqiGlhXUHp8=
X-Gm-Gg: ASbGncs8N4CD6a9IbWtl/8iYnaPeToid8H+WsPVlJbjBjOLIAR7W78eHz7KUVxxACJr
	BRY3o8peS/93ScFnz2CezEp82JybWKmdiFQrFlH38x9ljY5GRKhEYeg5zuNISQ0Y9Uef7zp4yG9
	FytuddyOJnnTXQUxmXskuRTvZ29pQHfW4B8G3leedH
X-Google-Smtp-Source: AGHT+IEzSUF0PN2hp/Gtr/+iJqMvfT8qG9nhtQrv9EiomNxhI8pyF8WH8lioqPhwIzbQ5eHBpQM4Hl8d3Xkk+C3gW+0=
X-Received: by 2002:ad4:5d4a:0:b0:6e6:61f1:458a with SMTP id
 6a1803df08f44-6f2c454e561mr99974026d6.14.1745054977419; Sat, 19 Apr 2025
 02:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250418221443.1067938-1-devaanshk840@gmail.com> <20250418224555.5b8b8232@batman.local.home>
In-Reply-To: <20250418224555.5b8b8232@batman.local.home>
From: Devaansh Kumar <devaanshk840@gmail.com>
Date: Sat, 19 Apr 2025 14:59:25 +0530
X-Gm-Features: ATxdqUG0pXnNpetJs8q58l01fGlH1NyIhqnV12gdFCtoWWynJdXAqpFRLsa3emk
Message-ID: <CA+RTe_gcBZh43txCyG6hQX5GF0bYbg8swJ5iPm4usanMn8BDAg@mail.gmail.com>
Subject: Re: [PATCH v4] tracing: Replace deprecated strncpy() with strscpy()
 for stack_trace_filter_buf
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Apr 2025 at 08:15, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Sat, 19 Apr 2025 03:44:41 +0530
> Devaansh Kumar <devaanshk840@gmail.com> wrote:
>
> > diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
> > index 14c6f272c4d8..0f2253f3bc8c 100644
> > --- a/kernel/trace/trace_stack.c
> > +++ b/kernel/trace/trace_stack.c
> > @@ -542,7 +542,7 @@ static __init int enable_stacktrace(char *str)
> >       int len;
> >
> >       if ((len = str_has_prefix(str, "_filter=")))
> > -             strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
> > +             strscpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));
>
> Is the sizeof() needed?
>
> From include/linux/string.h:
>
> /**
>  * strscpy - Copy a C-string into a sized buffer
>  * @dst: Where to copy the string to
>  * @src: Where to copy the string from
>  * @...: Size of destination buffer (optional)
>  *
>  * Copy the source string @src, or as much of it as fits, into the
>  * destination @dst buffer. The behavior is undefined if the string
>  * buffers overlap. The destination @dst buffer is always NUL terminated,
>  * unless it's zero-sized.
>  *
>  * The size argument @... is only required when @dst is not an array, or
>  * when the copy needs to be smaller than sizeof(@dst).
>  *
>  * Preferred to strncpy() since it always returns a valid string, and
>  * doesn't unnecessarily force the tail of the destination buffer to be
>  * zero padded. If padding is desired please use strscpy_pad().
>  *
>  * Returns the number of characters copied in @dst (not including the
>  * trailing %NUL) or -E2BIG if @size is 0 or the copy from @src was
>  * truncated.
>  */
> #define strscpy(dst, src, ...)  \
>         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
>
> With stack_trace_filter_buf defined as:
>
>   static char stack_trace_filter_buf[COMMAND_LINE_SIZE+1] __initdata;
>
> This looks like a text book example of just having that be:
>
>                 strscpy(stack_trace_filter_buf, str + len);
>

Right I have tested it, just using strscpy(stack_trace_filter_buf, str
+ len) works.


> -- Steve
>
>
> >
> >       stack_tracer_enabled = 1;
> >       return 1;
