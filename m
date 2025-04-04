Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77D81F0E31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773856; cv=none; b=O7+G5BcKbheU66iC6maJC89/395DwQAxLt3xWPBO065hrzHBPsj9pxwu34n02T/s3oVDOWWp8+6VcilAgpA9rcOrVy73sXXCTPJY+6jqbXz3QspKSLzw5eeHJBhTXSF4+OI5pF6X+797Fcl2EqGrhmCiNtuj70dMYF9tbUp1kiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773856; c=relaxed/simple;
	bh=0crlg9CVa208L3y+THC+49CvF+wOGo5V0hcKmYV1HSk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/6behqwIjL5OD1nDEfFANEKTTL2bQzqtmcrntWYpSwscw1lanFhAPpC3t/G57s6lpYkdfb2YTLPUbFjHP7F/Yt32jv6jLAaJS0VwbOkyku3RAB9EUMBB5U7LUqRvQn0YrRVe/oRzvanz74zuJCSiw/SKyz8E73K50L+GTmFyRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 338AE40949
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.651
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtdwovnNL7cu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 13:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=a6zo=ww=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11114403F4
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11114403F4
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 11114403F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:37:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B574FA474C6;
	Fri,  4 Apr 2025 13:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8416CC4CEE8;
	Fri,  4 Apr 2025 13:37:30 +0000 (UTC)
Date: Fri, 4 Apr 2025 09:38:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Devaansh Kumar <devaanshk840@gmail.com>, mhiramat@kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] tracing: Replace deprecated strncpy() with memcpy() for
 stack_trace_filter_buf
Message-ID: <20250404093837.154d1239@gandalf.local.home>
In-Reply-To: <2e5aae65-316a-48c1-b293-041bfbd1ed80@efficios.com>
References: <20250403191342.1244863-1-devaanshk840@gmail.com>
	<20250403153651.1188135b@gandalf.local.home>
	<CA+RTe_gHo3U-tWM9MA4CMgxM13=biqkqnAbuS5Yuidrono1bvw@mail.gmail.com>
	<2e5aae65-316a-48c1-b293-041bfbd1ed80@efficios.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Apr 2025 08:54:33 -0400
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> >>> -     if ((len = str_has_prefix(str, "_filter=")))
> >>> -             strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
> >>> +     len = str_has_prefix(str, "_filter=");
> >>> +
> >>> +     if (len)
> >>> +             memcpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));  
> >>
> >> Hmm, this location looks like it can just use strscpy().  
> > 
> > Yes strscpy() also works. But since stack_trace_filter_buf is length
> > bounded, shouldn't memcpy be the right choice?  
> 
> It's not only about the destination, but also about the source length.

Correct.

> 
> AFAIU, turning a strncpy into a memcpy here will overflow reading the
> input @str if the input string is smaller than
> sizeof(stack_trace_filter_buf) + len.

The old code just read str + len and what was after it until it hit a '\0'
or the COMMAND_LINE_SIZE limit.

memcpy() always reads COMMAND_LINE_SIZE (which is sizeof(stack_trace_filter_buf))
and will read more of the source "str" than may exist. Which as Mathieu
pointed out, is a bug.

-- Steve

