Return-Path: <SRS0=sDOq=IS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21DDC433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 12:45:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B65A61971
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 12:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B65A61971
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E5A160685;
	Sat, 20 Mar 2021 12:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAAYLnLv_UdS; Sat, 20 Mar 2021 12:45:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DF9D605A6;
	Sat, 20 Mar 2021 12:45:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F27DC000A;
	Sat, 20 Mar 2021 12:45:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55DF0C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 12:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5049760685
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 12:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnmFGi4L5LMM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 12:45:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 365E0605A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 12:45:30 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id c204so7786126pfc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ErfJAt/mRnqXnYm4yKcWK3E+xKBF1KIHjNRm05dEwgo=;
 b=hXTcIhBPBRlr0bycdoJINwO5S5KzxcgTl/+FD8X8BiD/498zCDr/6abLhbnvG5lRS1
 bXWLT/AgOh06CWltzjPOxC1690Ng3p0avNClSLcwM6fzmHT3YnZbWPHyPr3I56G5fqBp
 9UxnvAUnHEPtm/0Ig6SosTspkSZ9y2ydZuvClR3Pghhfdq601vD7lSWzrS+IW9yfg22u
 63BbJGgfE1pQV3WK80mxh8XSrpJZufV+1hyW+U/F7EqL/QC9QS9zeGSmbOUE9oPkt23K
 PheW2zD5GuO1pHA3iqRvXyctr2zcFrb3Nz9l2tRxbk/9JDq/a/jOy+QmMf62tHTP68cA
 Vgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ErfJAt/mRnqXnYm4yKcWK3E+xKBF1KIHjNRm05dEwgo=;
 b=c+9J7QCzcYSHcbq4/ABMR0UaSoGVFnr4tzACIA4n+o2UmDLDuuvX3EtOxlT7dTJboP
 0y1axCZhpZmn0xBZLBwPc+Cqidw8WXOjHoCIs931hUET9G7USSs8eGMdknn68MFARoeI
 MFDo56nbd/p80kKGiNxsbw/+YgGby21j00ugNukf/9mBoMtoXBUmul6nwXjIBIuDgH6g
 tj096RDPhnSHfAmQ4NLw5kOZXcwFB2M0gK9P0JMgO+36DomWk9sP+FfESm8ZrkpDjLmQ
 X8HghIMYJcWVCia2JJ/3nY4UztWChtDwi9OrWfeHf9M4DTntUcrKjZ7PZ1ebsIGMJwCn
 JwBA==
X-Gm-Message-State: AOAM530e651/We5dgI7CY8REa6mYNbxkcYnPAd816AMP5MP/ghuVSd7u
 HNr0Z2/mXFokZzvP7K+iwQ7+1+eChfqlSA==
X-Google-Smtp-Source: ABdhPJyYjTZEParm4KJEnGN9fEm1eobKloCYmqPEEe4IdwIaAE14Hhg6+pdQYrGpyKGCe9AObi4dKQ==
X-Received: by 2002:aa7:952c:0:b029:1f1:533c:40d7 with SMTP id
 c12-20020aa7952c0000b02901f1533c40d7mr13584388pfp.81.1616244329328; 
 Sat, 20 Mar 2021 05:45:29 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:1ce8:18d9:6e3d:8c29?
 ([2405:201:600d:a089:1ce8:18d9:6e3d:8c29])
 by smtp.gmail.com with ESMTPSA id v27sm8420641pfi.89.2021.03.20.05.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 05:45:28 -0700 (PDT)
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
From: Aditya Srivastava <yashsri421@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
 <871rcg2p8g.fsf@meer.lwn.net>
 <CAKXUXMzwTp1H_vokVEAJSnmm7jNHfWzhhmLfpcrrBD9b8ak+dA@mail.gmail.com>
 <878s6kto3g.fsf@meer.lwn.net>
 <CAKXUXMxWOvM5HRwmAAWEsqQc2k6_ReqRw0uD=VANLO5D7OpFtg@mail.gmail.com>
 <87o8fgpbpx.fsf@meer.lwn.net>
 <99a21e10-266e-b997-7048-c29a570afe0b@gmail.com>
Message-ID: <30051ed8-33e4-a303-199c-f4bdcb0e448a@gmail.com>
Date: Sat, 20 Mar 2021 18:15:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <99a21e10-266e-b997-7048-c29a570afe0b@gmail.com>
Content-Language: en-US
Cc: Markus Heiser <markus.heiser@darmarit.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
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

On 20/3/21 12:23 pm, Aditya wrote:
> On 18/3/21 11:48 pm, Jonathan Corbet wrote:
>> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
>>
>>> Yeah, and as this line-counting is really just a poor man's
>>> heuristics, we might just be better to really turn this heuristics
>>> into a dedicated cleanup warning script, then we can check for more
>>> indicators, such as "does it contain the word Copyright" somewhere in
>>> the kernel-doc comment, which tells us even more that this is not a
>>> kernel-doc as we would expect it.
>>
>> I really don't think we need that kind of heuristic.  The format of
>> kerneldoc comments is fairly rigid; it shouldn't be too hard to pick out
>> the /** comments that don't fit that format, right?  Am I missing
>> something there?
>>
>> Thanks,
>>
>> jon
>>

Hi Lukas and Jon!
I have a question, should I clean up the files with '/**' like
comments in only header lines? Or as we are planning for making it
generic, for other lines as well?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
