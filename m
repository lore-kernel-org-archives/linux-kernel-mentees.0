Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E071FE94117
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Oct 2023 20:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66DF9400C7;
	Fri,  6 Oct 2023 20:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66DF9400C7
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailo.com header.i=@mailo.com header.a=rsa-sha256 header.s=mailo header.b=o2d03Ah7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyYFMb6U2V_N; Fri,  6 Oct 2023 20:31:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4F6B5400AF;
	Fri,  6 Oct 2023 20:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F6B5400AF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23CA9C0039;
	Fri,  6 Oct 2023 20:31:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B81E7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 20:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86535400C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 20:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86535400C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHI64MLEu-lF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 20:31:56 +0000 (UTC)
Received: from mailo.com (msg-2.mailo.com [213.182.54.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6429E400AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 20:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6429E400AF
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1696624306; bh=Y4jHqWVhg8UVkLv5fZyoADZGkDruWn4t1ImjwzaYqSU=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=o2d03Ah7JurwHjIFIbYZgleEMDCXs4WwJhDHNo5OVGZ/pFQiO3mYDlHqU23bnFPpr
 TGdg/OkROzt8n50zqwiEYkUn+yxfXyOsJ3MXBy33PPbTxzaT6qE6eBU967o3t7RBvR
 ZiwCior4gp1GPZJzndxHL0zrdCGzpH3tgKDkvmqQ=
Received: by b221-1.in.mailobj.net [192.168.90.21] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Fri,  6 Oct 2023 22:31:46 +0200 (CEST)
X-EA-Auth: UClDyyuJLMlcEtduCfdeslkp9xbtqk3b1bqHZBK3wuhDdmOuGG+L9YD7aXBERKrUuooUJCZYmnZ6PsfJkhUW2w==
Date: Sat, 7 Oct 2023 02:01:43 +0530
From: Deepak R Varma <drv@mailo.com>
To: linux-kernel@vger.kernel.org, rostedt@goodmis.org
Subject: Re: [PATCH] tracing: Fix minor typos in samples header
Message-ID: <ZSBur4SMqx/oELp0@runicha.com>
References: <ZQN7HiaghPYu4sAl@runicha.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQN7HiaghPYu4sAl@runicha.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Sep 15, 2023 at 02:59:08AM +0530, Deepak R Varma wrote:
> Following minor corrections in the comments section of the trace
> events sample header file.
>
>    - There are 6 parts of the TRACE_EVENT macro instead of 5 (name,
>      TP_PROTO, TP_ARGS, TP_STRUCT, TP_fast_assign, TP_printk).
>
>    - The example variable for __field_struct type should be the
>      variable name instead of the variable.
>
>    - Improve closing brace alignment to improve readability.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---

Hello,
May I request a feedback/status of this patch proposal?

Thank you,
deepak.

>  samples/trace_events/trace-events-sample.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/samples/trace_events/trace-events-sample.h b/samples/trace_events/trace-events-sample.h
> index 1c6b843b8c4e..551ecad212c8 100644
> --- a/samples/trace_events/trace-events-sample.h
> +++ b/samples/trace_events/trace-events-sample.h
> @@ -61,7 +61,7 @@
>  #include <linux/tracepoint.h>
>
>  /*
> - * The TRACE_EVENT macro is broken up into 5 parts.
> + * The TRACE_EVENT macro is broken up into 6 parts.
>   *
>   * name: name of the trace point. This is also how to enable the tracepoint.
>   *   A function called trace_foo_bar() will be created.
> @@ -93,7 +93,7 @@
>   *
>   *         __field_struct(struct bar, foo)
>   *
> - *         __entry->bar.x = y;
> + *         __entry->foo.x = y;
>
>   *   __array: There are three fields (type, name, size). The type is the
>   *         type of elements in the array, the name is the name of the array.
> @@ -410,7 +410,7 @@ TRACE_EVENT_CONDITION(foo_bar_with_cond,
>
>  	TP_STRUCT__entry(
>  		__string(	foo,    foo		)
> -		__field(	int,	bar			)
> +		__field(	int,	bar		)
>  	),
>
>  	TP_fast_assign(
> --
> 2.39.2
>


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
