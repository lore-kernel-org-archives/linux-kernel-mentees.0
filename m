Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273E8CE7A88
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Sep 2023 17:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A0C941835;
	Sat, 23 Sep 2023 17:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A0C941835
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JHc1T9Ky
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i15DFHcvd_cU; Sat, 23 Sep 2023 17:30:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 070AA41828;
	Sat, 23 Sep 2023 17:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 070AA41828
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6F1EC0039;
	Sat, 23 Sep 2023 17:30:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE8BAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BEA540C1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BEA540C1E
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JHc1T9Ky
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n37C479MN5_W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:30:47 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F34BC400FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F34BC400FE
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-565334377d0so3002474a12.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695490246; x=1696095046;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hqVcpoe1kOppgOo9sz7e5PA+cHdVczMYuQbWhKjq+0w=;
 b=JHc1T9KyBiGMhCnKquF8C53tZMtwXPCF0wO7+d47dintXpOs7Il0rxwBZVlINWjReB
 N12IQX6fPsbf5Tf6rpSmhCRych7xBeHl8telb1/9qUsRPXi11TwUJKdeaxHmfd9fnFnc
 S9ttz5d+xr3iqApBSI/qu75F50/wsTOeiFned/ewJ0LFkPgudDCXc1VeKsOC1DZFRCPu
 ZC0P2Pif2MowUBEy4RnnApTsa3BFFQkCMYw03zZufrNMovKpXvghS4iNXA5e56SGSVQl
 1cIcQKsOtZy8NLkn1euX59OmnKcVivKZQlpB+T+5OLAx0zdmxQD2/UMUJJWfSzqKDpDx
 cWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695490246; x=1696095046;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqVcpoe1kOppgOo9sz7e5PA+cHdVczMYuQbWhKjq+0w=;
 b=EYOxWvOmQtAgXMdPgyUX4taNVCuFrBKz2WUSmxvxDkp6DhFMi6knEyCJunRlftfK13
 w2yUmqVQjHnIw3fnFds//TMznFiHd8hq6zMQgpNaHWyl5IQQPkQAn2ayk4Phqcnkzj2l
 4U0IpVRFHmW6FfLBUB5nFq6MFDSEQDRL2a9FHvQAy2ewoKy5C36hV2FlpIHi6sxxQ8ha
 hH0mE0g+P8yaaP+XfRC+w/J+wNh0hcRJPOWNu2tYxqv2eJKqIFLelGtRxN2fEjZdBxbq
 NdU0oVmnuJh7PzvYz+oTzHnbSwXWZUJCsgb77t8O7DBg72zDGsr7ZaeIGaHBO+ZsK5tH
 /09Q==
X-Gm-Message-State: AOJu0Yy1Zi+ZTP65ap+qM6bSNsuFEaNjF2lDlTshbRKaDMu8DQoPDkjQ
 mLJmZURREiLWl0eIrGlakyo=
X-Google-Smtp-Source: AGHT+IHPdAb9M4jmm7oPBQjTAdl+QuO4EQ9Bp6jQsdh2Qe+b4XyW/HGfpl9cadv6/1o1cEmZV/rE8w==
X-Received: by 2002:a05:6a20:4290:b0:14d:16c:2d20 with SMTP id
 o16-20020a056a20429000b0014d016c2d20mr3333712pzj.44.1695490246251; 
 Sat, 23 Sep 2023 10:30:46 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:52e1:3075:4405:fdad:b3f9])
 by smtp.gmail.com with ESMTPSA id
 fk22-20020a056a003a9600b0068a30f6cf32sm5294269pfb.143.2023.09.23.10.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 10:30:45 -0700 (PDT)
Date: Sat, 23 Sep 2023 23:00:40 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
 davem@davemloft.net, mhiramat@kernel.org
Subject: Re: [PATCH v1] samples: kprobes: Fixes a typo
Message-ID: <20230923173040.GA159038@atom0118>
References: <20230817170819.77857-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817170819.77857-1-atulpant.linux@gmail.com>
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
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

On Thu, Aug 17, 2023 at 10:38:19PM +0530, Atul Kumar Pant wrote:
> Fixes typo in a function name.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
>  samples/kprobes/kretprobe_example.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
> index cbf16542d84e..ed79fd3d48fb 100644
> --- a/samples/kprobes/kretprobe_example.c
> +++ b/samples/kprobes/kretprobe_example.c
> @@ -35,7 +35,7 @@ struct my_data {
>  	ktime_t entry_stamp;
>  };
>  
> -/* Here we use the entry_hanlder to timestamp function entry */
> +/* Here we use the entry_handler to timestamp function entry */
>  static int entry_handler(struct kretprobe_instance *ri, struct pt_regs *regs)
>  {
>  	struct my_data *data;
> -- 
> 2.25.1
> 

	Hi all, can someone provide comments on this change.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
