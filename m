Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B1FC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:09:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0743F22226
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KG/w2uA0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0743F22226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3553874D8;
	Sat, 21 Nov 2020 12:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sM2Ex+-LoAux; Sat, 21 Nov 2020 12:09:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 271F3874C9;
	Sat, 21 Nov 2020 12:09:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A042C1825;
	Sat, 21 Nov 2020 12:09:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CC46C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 742D984413
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCUC8420rl4y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:09:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E25FA86A37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:09:40 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f18so9785468pgi.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 04:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cdJCVla5veYCskmEzfdyfZAfy0ZAxKqkkl80+xwHN4w=;
 b=KG/w2uA0tvGgamKy1FGbe54rVAmN9L6k/OaHtZXHfZZb98t8VfQVJG/S0k22t4+kyi
 pqQgHRUAzR4IH8o/QLmX+yp8DLbOztVZKfU4K9HOOsBHxHSiHtH0jpPV9YEq1tcK6Uf+
 XM0vKlvWZHDy8yAsIalKOsOs2jxvVjmdHniu//mlvCDT1teEAZ1igXge/BuMMfYNAcOE
 8IoZL6Zk2Dv7CTyNda8xwaoqaQVdTwa4R4CnFwMdVvONPoeI9wr0nnlhMTx6vRwnqcDJ
 IuxUo8HtkVqBR6/83wd61A4j/0tmKGKhoHGcjrlfDpgWNRACacDM+1Vo92xSeZf0Sjyv
 uiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cdJCVla5veYCskmEzfdyfZAfy0ZAxKqkkl80+xwHN4w=;
 b=VSNrVKYW1OFZzFdCCwmLy8PG7Nndn63fWFix48NAB5rlHXO8WdZO1cvQ7ryuEBRBkM
 P4dmiTM26uCSBBxrMgIFk6GHNe1+oFiUE4ezbm+A24FdFyMPzZ8tsf55AVX2vCn7YwZo
 +1fudCM14ldoTDedIwrhJgVb9VPRmpKcsrxCy1huWko5Lat/UHCmMx1PoYP0IZhpkPLO
 uLN8h1OCeFxgsOYcyC2rGSfwy8cHetdU57A7ucBIX3yDmOVNi8xERWaJWSDlf4/XDIuD
 pOiXcyV98m7VCQStvCJKFJu8nueIfiGwxOrNzmpkvq6RAO6Yh+fvlQkK7azXpPZ7hIWi
 QYHg==
X-Gm-Message-State: AOAM530/3BVy94RmuqThGqoQG5QHrq9o0zkiosV4fiivv7EfBT34Lkaa
 x3ah5mQEmctCWH+xlM2TJLxT4j2Aj6q30Q==
X-Google-Smtp-Source: ABdhPJym6/u5bwN7OAO1H9SFTwVShbhu5Srr6JVGaopEm/gaIoKlJfAZ4B2MREMpxJMggdAzmO9QRg==
X-Received: by 2002:a62:fb12:0:b029:160:4c48:b9e1 with SMTP id
 x18-20020a62fb120000b02901604c48b9e1mr17237427pfm.8.1605960580254; 
 Sat, 21 Nov 2020 04:09:40 -0800 (PST)
Received: from ?IPv6:2402:3a80:400:4498:ed91:20bf:333c:1bc4?
 ([2402:3a80:400:4498:ed91:20bf:333c:1bc4])
 by smtp.gmail.com with ESMTPSA id b5sm6916035pfr.193.2020.11.21.04.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 04:09:39 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
 <20201118173950.32660-1-yashsri421@gmail.com>
 <CAKXUXMw=NnO4pU01bmTH+pkLckcJzByPktGJPuLf9st+x4VbXQ@mail.gmail.com>
 <30d4ab51-41e7-d535-7cb2-5ae9d02cf58b@gmail.com>
Message-ID: <0053bab6-cbd9-1350-8e3b-ccb457a76f80@gmail.com>
Date: Sat, 21 Nov 2020 17:39:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <30d4ab51-41e7-d535-7cb2-5ae9d02cf58b@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
 for NETWORKING_BLOCK_COMMENT_STYLE
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

On 19/11/20 4:14 pm, Aditya wrote:
> On 19/11/20 12:30 am, Lukas Bulwahn wrote:
>> On Mi., 18. Nov. 2020 at 18:40, Aditya Srivastava <yashsri421@gmail.com>
>> wrote:
>>
>>> Currently, checkpatch warns us for files in 'net/' and 'drivers/net',
>>> if we use an empty '/*' line for comment and contents of comments are
>>> in next line
>>>
>>> E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
>>> the refs / unrefs from the transport") reports this warning:
>>>
>>> WARNING: networking block comments don't use an empty /* line, use /*
>>> Comment...
>>> +               /*
>>> +                * If the TXQ is active, then set the timer, if not,
>>>
>>> Provide a fix by appending the current line contents to previous line
>>> and removing the current line
>>>
>>
>> Patch generally looks good.
>>
>> Can you check how many comments in net actually follow that style and how
>> many follow another style?
>>
>>
> 
> In drivers/net:
> Wrong style: 14695 lines
> Correct style: 147961 lines (ie around 10 times)
> 
> In net/:
> Wrong style: 5090 lines
> Correct style: 30485 lines
> 
> There is also a documentation regarding this different comment format,
> and can be found here:
> https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
> 
> Thanks
> Aditya
> 

Hi Lukas
This mail probably got missed. Please review this as well :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
