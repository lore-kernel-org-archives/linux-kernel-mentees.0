Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F43C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 13:24:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7854921D43
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 13:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDnJMBsE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7854921D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F34328674E;
	Sat, 24 Oct 2020 13:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1hOGJE14NrE; Sat, 24 Oct 2020 13:24:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C61B286830;
	Sat, 24 Oct 2020 13:24:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC726C0052;
	Sat, 24 Oct 2020 13:24:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC9E9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 13:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B9CBD8674E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 13:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDc8y+4OnEmP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 13:24:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F02C886830
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 13:24:28 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id 1so2468104ple.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 06:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WKK8YZuOj3Yh6We8Y+x2rmG2WWLX2F33ea9of7SdLcU=;
 b=PDnJMBsEhleRMRxBsspAd228iliqApLm5aVCYMsttPhfVahie7p50RrwWUOSUjRI1Z
 TQv4XzWWz+odtXmaeMo+TBM+p+qZJBOXDkmwLJtZdiNmiVVv+U6uY1doe1n41ec6vzCP
 RkFOOxSyBk4Fd85EFsx6dWUnIiqi8zXRYTIUlXeifUHSPQUmjdhxU3yxzroQMN+Um69Y
 4C/kk5pl3IdsQl9VNQWoLpiHyQ72LW9KzHeVXAJzmh8qZON0VnrlTjJUsmQkpevNEVi0
 wPw/TIV+HhxujKnF3kXtVs6llqtcPMKpHK6I5ylCeXJTFdlqdgqtFYkAbBtkOWLmqOZz
 2fIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WKK8YZuOj3Yh6We8Y+x2rmG2WWLX2F33ea9of7SdLcU=;
 b=i+wcxJdyf+aND+O3LHnQ448Ez2Y/hyCVLQJoIE0nn+H0D80YSiYE/XbpVLIDrfzoQS
 rNW44gtOUgFaY+IfHQM1jTQosH6lwNSEStoVf5ocsQGmXqxmJ1siEz7qIZShL+ep+TxB
 hvAYh2Cb3etgIHDRJ5HpvBL09WdDM9xJDweiIN72yFUngsapXxo0KoSr3iyNbmpqSDox
 QhnbV6IhmXB2QZZkbX5nKUgMmGgA+GCwubZq4v99lyP/YAb7LhUWWu7NUmDD8l2z1QVe
 EFvwNO/jIdEuHy8dXSiaLOF39YjDRZJosfPcG9lQ0Km1WrBKXkK84DESkz6oGwRkDdh6
 pxjA==
X-Gm-Message-State: AOAM5339xD7b/8rD1GuMcy00gSyJ+bL0coJopOcGRn4chFGZEY46W+Qi
 suaJdraXYccPlroBdyddfig=
X-Google-Smtp-Source: ABdhPJzPcmq6tGCFnwdcWkYFySvcrzQ24fdevzf4NIsgatgYjtvgE7dokjoVc+RTHubxilthExFnoA==
X-Received: by 2002:a17:90a:c28f:: with SMTP id
 f15mr7591678pjt.143.1603545868511; 
 Sat, 24 Oct 2020 06:24:28 -0700 (PDT)
Received: from ?IPv6:2402:3a80:40f:9156:55ee:fad5:f15e:347e?
 ([2402:3a80:40f:9156:55ee:fad5:f15e:347e])
 by smtp.gmail.com with ESMTPSA id j23sm5250323pgm.76.2020.10.24.06.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Oct 2020 06:24:27 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201023133828.19609-1-yashsri421@gmail.com>
 <alpine.DEB.2.21.2010232104150.11676@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <c9512657-d7d0-bf04-0e40-b3463c9f5e1b@gmail.com>
Date: Sat, 24 Oct 2020 18:54:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010232104150.11676@felia>
Content-Language: en-US
Cc: joe@perches.com, dwaipayanray1@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On 24/10/20 12:36 am, Lukas Bulwahn wrote:
> 
> 
> On Fri, 23 Oct 2020, Aditya Srivastava wrote:
> 
>> Presence of hexadecimal address or symbol results in false warning
>> message by checkpatch.pl.
>>
> 
> I think this strategy now makes sense and has the right complexity for a 
> good heuristics in this case.
> 
> Nice job, Aditya.
> 
> Are you ready for a next challenge of this kind? Would you like to work on 
> further rules that can be improved with your evaluation approach?
> 
> Lukas
> 

Yes, I would like work on further rules.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
