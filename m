Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23A71494A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 18:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743790749; cv=none; b=ebIuHzYxnHpbGmFByfYbrHeMdS+9f5MvzTlEn4RDSpDkoc6Sem4BZdolevuvTx/4T70ymyty8ualp0U55Dlui4TVbRrMZeFrZIghDsguM9ftox41nxkBrMy3IpuOT64xur+w/+TK4vMSKORfhLlXLRhWfPJiFwwuiZsNS2qgB28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743790749; c=relaxed/simple;
	bh=fQ1ojn52AM70H1Vacbctyym8O6FScLm48lKuOs8h9FU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/RZ8d+TDctWE72YELQCFul3wl+as2SRnSuPhyI2P4EgGcs14S+rVvrPicONE4WvNBMmjbRynqcJYLFmI5O878mrdSEFVE+7CUDsKOznM9wKVfKIihiZEyIFvm/Qdnx0WMSCU5RXN9xeVY5Sa0E9ldaSZJv0SMrBMFWKZTz2Qsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE6C60C14
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 18:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.642
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLPqF3YDOgAe for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 18:19:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=a6zo=ww=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3E7B60B7C
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E7B60B7C
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F3E7B60B7C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 18:19:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D6E2A411AD;
	Fri,  4 Apr 2025 18:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD61FC4CEDD;
	Fri,  4 Apr 2025 18:19:02 +0000 (UTC)
Date: Fri, 4 Apr 2025 14:20:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3] tracing: Replace deprecated strncpy() with strscpy()
 for stack_trace_filter_buf
Message-ID: <20250404142010.4af17918@gandalf.local.home>
In-Reply-To: <20250404135850.2695211-1-devaanshk840@gmail.com>
References: <20250404135850.2695211-1-devaanshk840@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Apr 2025 19:28:48 +0530
Devaansh Kumar <devaanshk840@gmail.com> wrote:

> --- a/kernel/trace/trace_stack.c
> +++ b/kernel/trace/trace_stack.c
> @@ -543,8 +543,10 @@ static __init int enable_stacktrace(char *str)
>  {
>  	int len;
>  
> -	if ((len = str_has_prefix(str, "_filter=")))
> -		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
> +	len = str_has_prefix(str, "_filter=");
> +
> +	if (len)
> +		strscpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));
>  
>  	stack_tracer_enabled = 1;
>  	return 1;

BTW, why separate out the len? I use this notation quite a bit for
str_has_prefix() checks.

$ git grep '(len = str_has_pref' kernel/trace
kernel/trace/trace_events.c:    if (!(len = str_has_prefix(fmt, "REC->")))
kernel/trace/trace_events_filter.c:     if ((len = str_has_prefix(str + i, ".ustring"))) {
kernel/trace/trace_events_filter.c:     if ((len = str_has_prefix(str + i, ".function"))) {
kernel/trace/trace_events_hist.c:       if ((len = str_has_prefix(str, "key=")) ||
kernel/trace/trace_events_hist.c:           (len = str_has_prefix(str, "keys="))) {
kernel/trace/trace_events_hist.c:       } else if ((len = str_has_prefix(str, "val=")) ||
kernel/trace/trace_events_hist.c:                  (len = str_has_prefix(str, "vals=")) ||
kernel/trace/trace_events_hist.c:                  (len = str_has_prefix(str, "values="))) {
kernel/trace/trace_events_hist.c:       } else if ((len = str_has_prefix(str, "sort="))) {
kernel/trace/trace_events_hist.c:       } else if ((len = str_has_prefix(str, "clock="))) {
kernel/trace/trace_events_hist.c:       } else if ((len = str_has_prefix(str, "size="))) {
kernel/trace/trace_events_hist.c:               if ((len = str_has_prefix(str, "onmatch(")))
kernel/trace/trace_events_hist.c:               else if ((len = str_has_prefix(str, "onmax(")))
kernel/trace/trace_events_hist.c:               else if ((len = str_has_prefix(str, "onchange(")))
kernel/trace/trace_stack.c:     if ((len = str_has_prefix(str, "_filter=")))

It's fine being in the if statement as the if is more about "does this have
this prefix" and the length is just a side effect of it to use it to
extract the rest.

This patch is only about removing strncpy(), it doesn't need to modify the
format.

-- Steve
