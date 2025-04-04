Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36C1DDC29
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769716; cv=none; b=a1SgGVvcEA30ce7npkU9WG2rB6ARujvKCSG+o++DAdYzWjpbhUlTdbk7QN4s9jiukIb1ryOQ9wVBZsz8ZXIlmQ5rcrXNYT02mMfGXb59Y4FMpkPspOqB1esi5CR/VJFreEWebC9pjb/J5m4Ersm4qzJHPKQ67g0aiEiXPCob+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769716; c=relaxed/simple;
	bh=KZjsLs60eKQTbMKVSo/1zmWRNPndmLnFZEn4+d8V3g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJzAustYyEvfrXPP85IBq4Px0n8lhVjRTTXnxHFSlFz16yaEiLEAAn3hSIPrmGFn3cetFcNAeBU5XgQSd6fFNWTHxY/yqgGNWiILae/3KUIzAY/ykDZW3+RjVyfXzSCOeHYdC35xickDv9h8ReFfc9CpFJ7MynNOfmPwnQvOGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nE2/kbEu; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nE2/kbEu"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94B5B40D68
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 12:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfoF5E2sauoU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 12:28:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED12F40CBC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED12F40CBC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nE2/kbEu
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ED12F40CBC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 12:28:33 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6e900a7ce55so28693756d6.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 05:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743769712; x=1744374512; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o+hauuYwPuT1296IGAMtUlOboJ7YBvYP4aT7j1Si95I=;
        b=nE2/kbEui21FIfM/ta3HAIBeaCAemGIdoAAA3KW/49XT+IaHdMGIGW1ecViMpJlE02
         1RIsrZqwqWOll6edfiP/J0n18fF91vfrFlizngI1fbWPqnGtGEc7bV01XBIWjgMjUued
         PHJWllRv984JeocKcqYUyEf6S8wvrEkzgUVkuvfE2CgAy3+/SdjfAt+8H41tu//whmgp
         6uarchr3V61jWRV+7miTpa/pnz3Xm4inIUXGpKHK4uLbuNCv54OkNYEEvRLWmi2TtQGo
         Q+PCPvkoagIT1V1pwt9NMfVku5034B7Fr+9VwhaXMWxw1awpWZClfyWJfQ9dCqrgEfp0
         VrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743769712; x=1744374512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+hauuYwPuT1296IGAMtUlOboJ7YBvYP4aT7j1Si95I=;
        b=ZCGmo0dFUj3v6RJb4QAXN1TXY1IaVyQElo4APKyNLL9vO2mvOyPlfUbUQagMO1Pc5T
         qF6klCrKprXnA1tU/UgWv6D8cCVQlEZktvjAX8U7xLF6zIADUKOqgmzMu/1VYna//kQD
         I2TgkPAjfnxTOCOST/dw0QIs1VusBnwd0Pqs9nqOPd6+6DzeCT8L6BQs+co8IoY6QRim
         7sJjaRGrIRWMMWmUt0oHiwDjeiEoALSfxhbDnP76f4hs2uJKwat4SduFMnbOBCvwVA01
         ZBGFdwgdLFEZ/vPaS4o6eB46QuND5TPvQiypr6ms16hVpoz+GyOubD4nGvZaOUAvS3ym
         QqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYnDASndslTT3nzC7SF1bZA7oGWgLIXjHup1Faz2Ysw5947eyRqmGU2p3Tv4p3jhUFuGfdbMgV163vhw3W6RNV+alq4w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxqIREl4k0x4k9rAScXKY3UrezSWHaXrUX1es01a8l3ipnHBaUE
	LXBFDWH33vQOMK7TrtQMPiX2sysd5Fh/T4buPt6c8WO+4caYR2U6brg7nnPXw4sXwGkfH/HCrny
	F/AnHj7P/lE9kJah1qaeEiqoYGKw=
X-Gm-Gg: ASbGnctHIGiZcvSlFKj8slW/XxCXRiWp/NwfCppsfhG+A9LrEMCEPRebpvnSOeb2DGl
	WfwBmhOzHDFJKAoKa9XI5bcD/e1NunebmGFFSmay55ia44MZ2HrebKUVTU/hR3mnALhtxLPgzs+
	oOjBuP3SacuZQVcQvTR0xFrG9dN8yNPPQXF9/6EjcuGjY=
X-Google-Smtp-Source: AGHT+IFPhzwGNtl0IhDD9nLnNfC4N91dZF5GdO3ERI/7YjNI4cm1KUvZsmYpodKH8TzNAWcVFDPCaBzI1mj7/9tdI4c=
X-Received: by 2002:a05:6214:226f:b0:6e8:fb7e:d33a with SMTP id
 6a1803df08f44-6f00def1d0emr38205426d6.22.1743769712357; Fri, 04 Apr 2025
 05:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403191342.1244863-1-devaanshk840@gmail.com> <20250403153651.1188135b@gandalf.local.home>
In-Reply-To: <20250403153651.1188135b@gandalf.local.home>
From: Devaansh Kumar <devaanshk840@gmail.com>
Date: Fri, 4 Apr 2025 17:58:21 +0530
X-Gm-Features: ATxdqUFByqjByFu259uDrwKu8qipavRypzCfuFFHLm4m4OlPj-M7vk1XNsA5pfQ
Message-ID: <CA+RTe_gHo3U-tWM9MA4CMgxM13=biqkqnAbuS5Yuidrono1bvw@mail.gmail.com>
Subject: Re: [PATCH] tracing: Replace deprecated strncpy() with memcpy() for stack_trace_filter_buf
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 01:05, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri,  4 Apr 2025 00:43:40 +0530
> Devaansh Kumar <devaanshk840@gmail.com> wrote:
>
> > @@ -537,14 +538,16 @@ stack_trace_sysctl(struct ctl_table *table, int write, void *buffer,
> >       return ret;
> >  }
> >
> > -static char stack_trace_filter_buf[COMMAND_LINE_SIZE+1] __initdata;
> > +static char stack_trace_filter_buf[COMMAND_LINE_SIZE+1] __initdata __nonstring;
> >
> >  static __init int enable_stacktrace(char *str)
> >  {
> >       int len;
> >
> > -     if ((len = str_has_prefix(str, "_filter=")))
> > -             strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
> > +     len = str_has_prefix(str, "_filter=");
> > +
> > +     if (len)
> > +             memcpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));
>
> Hmm, this location looks like it can just use strscpy().

Yes strscpy() also works. But since stack_trace_filter_buf is length
bounded, shouldn't memcpy be the right choice?

-- Devaansh Kumar
