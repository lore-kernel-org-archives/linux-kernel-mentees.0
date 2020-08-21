Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84572C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 03:14:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A7A20855
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 03:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSf5Jpl9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42A7A20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 078BB88618;
	Fri, 21 Aug 2020 03:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fl2d74U3LDUs; Fri, 21 Aug 2020 03:14:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C8B58861D;
	Fri, 21 Aug 2020 03:14:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57AD5C0889;
	Fri, 21 Aug 2020 03:14:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FE78C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 03:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0B6CE8813E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 03:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7GHOp92LKAiR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 03:14:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2720288132
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 03:14:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r11so362695pfl.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 20:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/YxLwfqRT0LzVr6sU/PoWPx80Kd+H0Hr2LJri5kk/Pc=;
 b=FSf5Jpl9/IFj6kOf3jntWnnXmVi0fLzyoVNQd9Et5l837ZviEz5bE51u7MyzY6jN8t
 1g9QNe55Es1Nb1JFpV+rTReUp4PBLd/w1e4Ub0VahG7xJ+3rH20rvqP+0UXh/87EGoFO
 pL9rqZH508dmmnpYu4gIA3rrQ50GklgzWc9//pBTGS/krgazkAdC/0lb83YMtgVqQ1DB
 yubYb7m7vreAwvGmz3sBZwhPm2//3l7q5G3aB2LawHC+oVLKanL0o7S0sPo1KCEkTwav
 soByUFvv+zRuPOu7B0Wy1d2ItNz2SDssVb/rRDupRH1JyZXec7eTt3BvN3ni3zpq0kn6
 coxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/YxLwfqRT0LzVr6sU/PoWPx80Kd+H0Hr2LJri5kk/Pc=;
 b=jC7BSJkIGTGyLOxqWsiwgjq8cfkSwR9gG7bBrK+tICbatyYMUaZLc+YmMupVkVze94
 38qTUbeceQ3Xe8JVOwU5svnjuyEWZOROndSYNSkotURllkff6g0UpwWikz4e2EsreSKr
 LaQGwZFWNvpcmYTbqup6fFjvOz+JRl2HZR62IaSFqv33G31nnGq4CM84iCIvtUHobLLY
 Hpd9mxXQzRR27dGhrVfpUX1n2Heji+QwBlHLdcXTUJyo+0vV/Fdy697fFtgK8c2iDxn4
 QmCPvSAOp55kfs4Lw47z3igBA613OPwOVXEfPAlzVxKFcltmDuUpKxGLo4srXZCnA77m
 BA6Q==
X-Gm-Message-State: AOAM533Z/8DQCHwjA9ClwUwH3EOhYOhg5umeNtqkAeo4K+Z+3CJ926wz
 CJrMJGGVZ9kqtxZR0/Myny4=
X-Google-Smtp-Source: ABdhPJz4sS4YBiY4YgsXDfQAOA6FAJKd3JDRxKn3w9h0Gc1psHawgfUEVTaUUsVEuEbrx9ShztbGLA==
X-Received: by 2002:a63:5a0f:: with SMTP id o15mr839105pgb.187.1597979657741; 
 Thu, 20 Aug 2020 20:14:17 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id np4sm376656pjb.4.2020.08.20.20.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:14:17 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 21 Aug 2020 11:14:04 +0800
To: Benjamin Poirier <benjamin.poirier@gmail.com>
Message-ID: <20200821031404.mjlqgcvvz3htxoj2@Rk>
References: <20200814160601.901682-1-coiby.xu@gmail.com>
 <20200814160601.901682-4-coiby.xu@gmail.com>
 <20200816025717.GA28176@f3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816025717.GA28176@f3>
Cc: Michal Kubecek <mkubecek@suse.cz>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 GR-Linux-NIC-Dev@marvell.com, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC 3/3] staging: qlge: clean up code
	that dump info to dmesg
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Aug 16, 2020 at 11:57:17AM +0900, Benjamin Poirier wrote:
>On 2020-08-15 00:06 +0800, Coiby Xu wrote:
>> The related code are not necessary because,
>> - Device status and general registers can be obtained by ethtool.
>> - Coredump can be done via devlink health reporter.
>> - Structure related to the hardware (struct ql_adapter) can be obtained
>>   by crash or drgn.
>
>I would suggest to add the drgn script from the cover letter to
>Documentation/networking/device_drivers/qlogic/

Thank you for this suggestion! I planned to send a pull request to
https://github.com/osandov/drgn. This is a better idea.
>
>I would also suggest to submit a separate patch now which fixes the
>build breakage reported in <20200629053004.GA6165@f3> while you work on
>removing that code.
>
I'll send a single patch to fix that issue before preparing for v1
of this work.

>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/staging/qlge/qlge.h         |  82 ----
>>  drivers/staging/qlge/qlge_dbg.c     | 672 ----------------------------
>>  drivers/staging/qlge/qlge_ethtool.c |   1 -
>>  drivers/staging/qlge/qlge_main.c    |   6 -
>>  4 files changed, 761 deletions(-)
>>
>[...]
>> diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
>> index 058889687907..368394123d16 100644
>> --- a/drivers/staging/qlge/qlge_dbg.c
>> +++ b/drivers/staging/qlge/qlge_dbg.c
>> @@ -1326,675 +1326,3 @@ void ql_mpi_core_to_log(struct work_struct *work)
>>  		       sizeof(*qdev->mpi_coredump), false);
>>  }
>>
>> -#ifdef QL_REG_DUMP
>> -static void ql_dump_intr_states(struct ql_adapter *qdev)
>> -{
>[...]
>> -	}
>> -}
>> -#endif
>
>This leaves a stray newline at the end of the file and also does not
>apply over latest staging.

I will fix it in v1. Thank you for reviewing this patch!

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
