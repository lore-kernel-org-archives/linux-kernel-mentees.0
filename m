Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6412C253F26
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 19:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743708951; cv=none; b=muL0HB9I1BJAqkdvLWC0SBxhGcWQW/Xyrw1BkxZUEG7dlKywl9lbnJi8FprfltsGhYW3O0zXAHSkeDBHhP4SkLNZP5Nh54z5R+RtRJtw+nfF/fHrJFgLS4qIV9x+9IbZiLSag3jNOpI2odlQiTO4axdh2EHkGW++t7j4KkvY2js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743708951; c=relaxed/simple;
	bh=SfudcGVvgUwCu02nkG9Exu6y8ntGP9LdeWrTt3lMa5A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWPRHkm9ywa+tRQQKDe9h9Rujy5yuRDJnhX5cq8XHN0ZFYgGk9nvkk877xxbNXpqd+P+8VMAmDIQWEFF6QL5gQnogG7o7a7iwaJ4Kj+TK08MPrpPOTtIbkGUsankTIPX1tu5uATFXjXn5k4mo0s1266p67J02pOL9GR/q2DbxZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 093FB8145F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 19:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.651
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0PE5o8nG0Dy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Apr 2025 19:35:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=70go=wv=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0995E813F5
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0995E813F5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0995E813F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 19:35:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7F825C6BA5;
	Thu,  3 Apr 2025 19:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9956C4CEE3;
	Thu,  3 Apr 2025 19:35:45 +0000 (UTC)
Date: Thu, 3 Apr 2025 15:36:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] tracing: Replace deprecated strncpy() with memcpy() for
 stack_trace_filter_buf
Message-ID: <20250403153651.1188135b@gandalf.local.home>
In-Reply-To: <20250403191342.1244863-1-devaanshk840@gmail.com>
References: <20250403191342.1244863-1-devaanshk840@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Apr 2025 00:43:40 +0530
Devaansh Kumar <devaanshk840@gmail.com> wrote:

> @@ -537,14 +538,16 @@ stack_trace_sysctl(struct ctl_table *table, int write, void *buffer,
>  	return ret;
>  }
>  
> -static char stack_trace_filter_buf[COMMAND_LINE_SIZE+1] __initdata;
> +static char stack_trace_filter_buf[COMMAND_LINE_SIZE+1] __initdata __nonstring;
>  
>  static __init int enable_stacktrace(char *str)
>  {
>  	int len;
>  
> -	if ((len = str_has_prefix(str, "_filter=")))
> -		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
> +	len = str_has_prefix(str, "_filter=");
> +
> +	if (len)
> +		memcpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));

Hmm, this location looks like it can just use strscpy().

-- Steve


>  
>  	stack_tracer_enabled = 1;
>  	return 1;
> -- 
