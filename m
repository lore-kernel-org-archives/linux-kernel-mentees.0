Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0580B1B4242
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743793153; cv=none; b=pkoteuIbpeA12T/zEbNV/3BsA3e/kSemhcFUqPQfC+AIXFy5/vwcB+iZZSN5Yvdor/xGNP+ud+LZzYgdJQvNu7tznpQiC7lNl/KQMNc90FHIkXB5nnYQ029dff9wFK/g2ifUrGjv70MuSf11ybB4D6e9SgXU1hGaM1Mh000mQFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743793153; c=relaxed/simple;
	bh=yQ9hdxCYDvZLZy9cwnQzNC/wg6VEZN0qrwYMaic6OB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afkbxRC6gvN9cyar8losF72PEKP0xjeoZPgBpnOVhwEZnCm/zf5nJZMLIAZfmbw4TOUpeF/tYfIKkiQXQ5f39D8miqLHe4Jyt24HU0bXqWwMuldMgAB2KHqercK+KU8rLat5GzpwhIIUyWx2nN/b6ee9UCWggrC/XnutxpyrLIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYhCEIeL; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYhCEIeL"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74B6940CAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 18:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSRTbNpnUYwH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 18:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBFFA40CE6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBFFA40CE6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KYhCEIeL
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CBFFA40CE6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 18:59:09 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c5b8d13f73so252931585a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743793148; x=1744397948; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IKjUACZPIJS63zOoRpXcIU0I0KFD19K+GUNwLuKaBJ0=;
        b=KYhCEIeLXCwE6ENCMBX1jkg0Rj31KpDYA2N1w3fTcZXQEjsLI11z5vp4jJgRI50PIA
         FxJqTbWVX+ZqV9Mt8Q2feKtrV0uJdqVS6enU4Mi1OmYLwD0XG+0PjGxUh+cvvP/39gLD
         Zjh0Ue2Xf1UcHi4OoSp17JI0qm3dHdJGbsLTvDncv5s0H7csBvNc3Prku2QF5rQ6Op0O
         1U8Dk1kW1eXS4rJ/PzZPD+byo43l9tHOnQKTte8JiaK3AxQX/esQyYAvAAFNtsB9fLJW
         sGzmwh95wNyA1WKTNHPdGtzgVYVvRdKA44cXiDIyqi1SlPvdjJp89cbTb/KdSTZpCpr2
         N0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743793148; x=1744397948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKjUACZPIJS63zOoRpXcIU0I0KFD19K+GUNwLuKaBJ0=;
        b=BWFMcb/DD0MjSKC2m0UkGgsOPpQedgwlFWaKnFpeH6EoZxi2qaHnq8emq8SE70xXJN
         FlTLyilOLpfWHZjy3y1aRvPU3EzNKk0J2a3HT4BOSI/QPehGuGreyn0L0p4dYAa4AhJn
         QR0FuBwKQO+TnqkQTgp1OWWv1AyiEJxHivp3fYMNnRo1Mk08VhGtIgHtYDWoXqZMDO2c
         5e47fMVc2ykvmgicD0KnEOe/qr/P5K6DQcxMALc1qutEfQHd513fapWrBkblRf0kZDeM
         kPrx5x8YqO4argJBqip/TOdvaPpgL5+tCicKz9svsU3OiWff1/l43vvGh67Qhtwy7GdO
         oJUA==
X-Forwarded-Encrypted: i=1; AJvYcCX9lm5O1khdxDMz4yas8Yc2Wazrv4W3+nBAS5znOz7VhxdxjJYuREX8/JgRtcX4jK5AS45D2EeKP4x5v2yi/jTtrUx8Jg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz/csRveuaNhJJEH6oCuLhHhJz2q0b8Z0z0/AjKN3mYW/QaoSg8
	Knug7k38KsVJ2I0F+vvE8mj4zcUpkokmKaQAfKFAZPaRBwAkxyiQOSOItEBJQQJu8EwvjEPSLwe
	uw8cFUc275yCyOntnCfD/A/efgzI=
X-Gm-Gg: ASbGncvyYRDRqeGcTpI18kIs6W+yl5cAY+wG9DT4ibZvXFhvz+OI3escRBDv15p3NU2
	f1qhpqsVdY/FyEuhdiWjWqHDzazGNyVFoY/JNPhqNoe41gRVfXvIYz34EXPM//2yz2pACzccq7b
	OdlKa4+piGrOV8Wu9Ki+gX8WvGTO4imoZpHk4y+7yyy+Y=
X-Google-Smtp-Source: AGHT+IHK4lPWaHjVzf96lEuYnTdrBloLkWqdaEB22PpT80oP2tng4AuXivWfJ/G3VF+mcikH2Q5kZKH9Fk2/cUXAY7E=
X-Received: by 2002:a05:620a:3723:b0:7c5:cdb5:271b with SMTP id
 af79cd13be357-7c775a0f60dmr500906185a.15.1743793148612; Fri, 04 Apr 2025
 11:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404135850.2695211-1-devaanshk840@gmail.com> <20250404142010.4af17918@gandalf.local.home>
In-Reply-To: <20250404142010.4af17918@gandalf.local.home>
From: Devaansh Kumar <devaanshk840@gmail.com>
Date: Sat, 5 Apr 2025 00:28:57 +0530
X-Gm-Features: ATxdqUGsIsK8DS_fm-3DSox-hiuQDVXc-gGywCAuYU_mxCWuj_VHuB0qEooATvY
Message-ID: <CA+RTe_iqc0qCaeZFsyv9==-VUH2VhqCU46Jx7C3ve2=VDwFUOA@mail.gmail.com>
Subject: Re: [PATCH v3] tracing: Replace deprecated strncpy() with strscpy()
 for stack_trace_filter_buf
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 23:49, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri,  4 Apr 2025 19:28:48 +0530
> Devaansh Kumar <devaanshk840@gmail.com> wrote:
>
> > --- a/kernel/trace/trace_stack.c
> > +++ b/kernel/trace/trace_stack.c
> > @@ -543,8 +543,10 @@ static __init int enable_stacktrace(char *str)
> >  {
> >       int len;
> >
> > -     if ((len = str_has_prefix(str, "_filter=")))
> > -             strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
> > +     len = str_has_prefix(str, "_filter=");
> > +
> > +     if (len)
> > +             strscpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));
> >
> >       stack_tracer_enabled = 1;
> >       return 1;
>
> BTW, why separate out the len? I use this notation quite a bit for
> str_has_prefix() checks.
>
> $ git grep '(len = str_has_pref' kernel/trace
> kernel/trace/trace_events.c:    if (!(len = str_has_prefix(fmt, "REC->")))
> kernel/trace/trace_events_filter.c:     if ((len = str_has_prefix(str + i, ".ustring"))) {
> kernel/trace/trace_events_filter.c:     if ((len = str_has_prefix(str + i, ".function"))) {
> kernel/trace/trace_events_hist.c:       if ((len = str_has_prefix(str, "key=")) ||
> kernel/trace/trace_events_hist.c:           (len = str_has_prefix(str, "keys="))) {
> kernel/trace/trace_events_hist.c:       } else if ((len = str_has_prefix(str, "val=")) ||
> kernel/trace/trace_events_hist.c:                  (len = str_has_prefix(str, "vals=")) ||
> kernel/trace/trace_events_hist.c:                  (len = str_has_prefix(str, "values="))) {
> kernel/trace/trace_events_hist.c:       } else if ((len = str_has_prefix(str, "sort="))) {
> kernel/trace/trace_events_hist.c:       } else if ((len = str_has_prefix(str, "clock="))) {
> kernel/trace/trace_events_hist.c:       } else if ((len = str_has_prefix(str, "size="))) {
> kernel/trace/trace_events_hist.c:               if ((len = str_has_prefix(str, "onmatch(")))
> kernel/trace/trace_events_hist.c:               else if ((len = str_has_prefix(str, "onmax(")))
> kernel/trace/trace_events_hist.c:               else if ((len = str_has_prefix(str, "onchange(")))
> kernel/trace/trace_stack.c:     if ((len = str_has_prefix(str, "_filter=")))
>
> It's fine being in the if statement as the if is more about "does this have
> this prefix" and the length is just a side effect of it to use it to
> extract the rest.
>
> This patch is only about removing strncpy(), it doesn't need to modify the
> format.
>
> -- Steve

Sure I'll keep that in mind.

-- Devaansh Kumar
