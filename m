Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3841F0E40
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774796; cv=none; b=jh7VbsgxhUD9Rn4gxDbDQfDeqwCUT0+A7SX67j8VtNTBDtL9TQDT9fcVIuV5os1tTymuhM/9g/jleJ0QCnJbV+EphdwJsM28uhqBJaB+IuH2tEj2HrMB7cnD8sv8lJLm+lkkUUQT4gR53wUn1tCylLK9gVErDwwl1nNsqk3mRec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774796; c=relaxed/simple;
	bh=RIjCzkBYrZ3eOlnkjx1fOdd9XKjiKDANIJ4T3CaLGWs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U66vXAIUOSXRjZS+iyJr1JtUOje/aI6x5aIgYz1kytMRH6SDELmD9UENRJZ7wesOE6q7KOy2kjwUTwBAoVCUJPAJC0rqyvsF/OKPg2QTLwWY9H4XrInWABoz89aDJFIZOpqNYfgr0zfPDHkBFSi0njL7mquYLXLA1cjBvmxS3Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C18D60E05
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.651
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTJ74F_99Tx5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 13:53:12 +0000 (UTC)
X-Greylist: delayed 465 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 04 Apr 2025 13:53:12 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 398E760B9D
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 398E760B9D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=srs0=a6zo=ww=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN> 
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 398E760B9D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:53:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B15D060010;
	Fri,  4 Apr 2025 13:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01423C4CEDD;
	Fri,  4 Apr 2025 13:45:24 +0000 (UTC)
Date: Fri, 4 Apr 2025 09:46:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] tracing: Replace deprecated strncpy() with strscpy()
 for stack_trace_filter_buf
Message-ID: <20250404094632.26f5b7c0@gandalf.local.home>
In-Reply-To: <20250404133105.2660762-1-devaanshk840@gmail.com>
References: <20250404133105.2660762-1-devaanshk840@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Apr 2025 19:01:03 +0530
Devaansh Kumar <devaanshk840@gmail.com> wrote:

> strncpy() is deprecated for NUL-terminated destination buffers and must
> be replaced by strscpy().
> 
> See issue: https://github.com/KSPP/linux/issues/90
> 
> Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
> ---
>  kernel/trace/trace_stack.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
> index 5a48dba912ea..982b1c88fce2 100644
> --- a/kernel/trace/trace_stack.c
> +++ b/kernel/trace/trace_stack.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2008 Steven Rostedt <srostedt@redhat.com>
>   *
>   */
> +#include <linux/string.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/stacktrace.h>
>  #include <linux/security.h>

Is string.h really needed here? And if so, please keep the upside-down
x-mas tree format:

#include <linux/sched/task_stack.h>
#include <linux/stacktrace.h>
#include <linux/security.h>
#include <linux/kallsyms.h>
#include <linux/seq_file.h>
#include <linux/spinlock.h>
#include <linux/uaccess.h>
#include <linux/ftrace.h>
#include <linux/module.h>
#include <linux/sysctl.h>
#include <linux/init.h>

The includes *are* ordered.

-- Steve
