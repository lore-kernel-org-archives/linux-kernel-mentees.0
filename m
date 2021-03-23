Return-Path: <SRS0=2Cfq=IV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307D8C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Mar 2021 17:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDFA8619AE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Mar 2021 17:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDFA8619AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 898676085B;
	Tue, 23 Mar 2021 17:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWaI3YNLluXR; Tue, 23 Mar 2021 17:29:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF4F96059E;
	Tue, 23 Mar 2021 17:29:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94B2BC000A;
	Tue, 23 Mar 2021 17:29:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 643A1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 17:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4684782974
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 17:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPwxRxY8r7QI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 17:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3CC38295A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 17:29:12 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id e33so12428808pgm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Mar 2021 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Wi4LJHw5jfEvsk7wZ9OkrUtU3aXuAPjNOhKa1Fc/yDg=;
 b=N6CofipRIMKcvqeE8tzhfWegNuhV3wp/ZE5mQDT+o/Gl9Sed65kludEkrkz6O/RMIk
 S2KHPRfM1Jbr+4fQpjr2BcPm+/K5dPvMiNWPeb+foeWRhjyWEm/2fOR2otjI++xx5Bid
 9sYScbwwVBQ4fxjJd9IWJmJ2k/zIBl8BTDjkBdnZbObjcQGF7Ho/D2TqcT4yUdrb0SN0
 eWOOF74MAjNzenT1XefOeurdoRstXYYY3b1Y8rYMlQQ6mPoeQMQo+F49LNe+/3ZlSLPd
 F2k5ZmW7Q/OjkvnEr9AtnZMHl1wFHWsn8Ou6L48puWDLcDlKMcKbA5BZ53N/ON3xwS5U
 HLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wi4LJHw5jfEvsk7wZ9OkrUtU3aXuAPjNOhKa1Fc/yDg=;
 b=sJQRTsA0r7IUZs2mnACQWEEPv7DMbsHTg9nRCo+cJvKt0UF5EJiP0IGt7zpU57Eykn
 3qb1VlAtNjM62xIISsEhtHY65SI9OBgzjWhWk1SYDppMdPQGq065lb/C1PE8ghH4vDAR
 gnRqnkiBIR9j5hjHzhQppcBx8lIohCdNKgdUrYxYjV3/jyP1jMgL5KE7SNxDe44y7cMY
 79MrBatzH+8wqPua1AnH45wNC/9aOob5eCpJbuPRF+ySg4PnubAc9wF197SHa5oHhOkU
 MfhB3xj6Dd2gPxEgU52TeN8dT+yd9owNzmXEOFs1GDjNZUipL9sqFW6foeqqenR/rZuy
 WO2A==
X-Gm-Message-State: AOAM531g/MB0LwJV2Rtk4CXRnYc+2pLaFsbdYXs++76+gb+LGtetvu9M
 T/3rFnVlb+vRYazRqjMc7bw=
X-Google-Smtp-Source: ABdhPJyDfOInpSkfi+8RTFT36FMcMpYAJCNMk4gBB2byJ9jSBhhNHGkFmSZhYPos0xTUriOooKLyUg==
X-Received: by 2002:a17:902:bd82:b029:e6:1ef0:82dd with SMTP id
 q2-20020a170902bd82b02900e61ef082ddmr6810849pls.43.1616520552179; 
 Tue, 23 Mar 2021 10:29:12 -0700 (PDT)
Received: from atulu-nitro ([122.174.244.83])
 by smtp.gmail.com with ESMTPSA id 6sm19050446pfv.179.2021.03.23.10.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 10:29:11 -0700 (PDT)
Date: Tue, 23 Mar 2021 22:59:07 +0530
From: Atul Gopinathan <atulgopinathan@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 1/2] staging: rtl8192e: Fix incorrect source in memcpy()
Message-ID: <20210323172907.GB21444@atulu-nitro>
References: <20210323113413.29179-1-atulgopinathan@gmail.com>
 <20210323135811.GI1717@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323135811.GI1717@kadam>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Mar 23, 2021 at 04:58:11PM +0300, Dan Carpenter wrote:
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> This is very clever detective work.  How did you spot the bug?

I remember trying to investigate a sparse warning couple of weeks ago in
the same file and went through the code when my eyes caught a struct
pointer being indexed, which looked wierd. On further reading of the
code and trying to make sense of what was happening (especially after
calculating the size of the pointer) I became sure that it wasn't
correct.

The first patch led me to the second patch as they were related,
"CcxRmState" was used in the same memcpy() of the first patch. I caught
the error in it's type while trying to fix the first.

Thank you for your encouraging words :D

Regards,
Atul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
