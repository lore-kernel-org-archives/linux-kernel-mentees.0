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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3360C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 06:53:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34E4C6199B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 06:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34E4C6199B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C86AB40355;
	Sat, 20 Mar 2021 06:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipLAqPMrk6K4; Sat, 20 Mar 2021 06:53:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB2B4031D;
	Sat, 20 Mar 2021 06:53:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6C89C000A;
	Sat, 20 Mar 2021 06:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99AD1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 06:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72A0140187
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 06:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hc0S36VNGuiR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 06:53:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEAA540179
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 06:53:32 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id q5so7405485pfh.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Mar 2021 23:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xaGlk2i4k4xjrgxv5GCvNM+Vcz1bxTHvvKwGlfw7Mxg=;
 b=XLrdFwzHA9lCbJzFer+aRn0FKRE/KKbYX4paLFhRsCU2OWn6bg2V7Yt782lecLwIZk
 3xS9SaJa8ecMvkxrRrr96vjN/5P1nrseX36JbMKoUgG1XoQNf4yILRr08n9P4dEAfVFN
 ndy4fyuIlVjfPCPb0nTDXTp9/yZ98DMLPTEmc6Tu4u2WC4ydAlu2VyjCOKNGhhXI/W2s
 GBKYw49T0i/luT3ABpb9oQcw5F/5XFbwNiSbXBknAC+ifddjsWO/UXPe88yJBfBeVWKC
 xt53hOZwHqc6xDLuhN4pc90scHhqsAZEdskl3yoVoGdd07GWJGYzw1ntC6TizMIDIweT
 QiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xaGlk2i4k4xjrgxv5GCvNM+Vcz1bxTHvvKwGlfw7Mxg=;
 b=OC76OsU5Ce1FE94kUeZzXzTUBemqCYZf2WwKorSFSR95mgcI6i/x9WIDEunOKrcHCg
 TEp62VWrZGMY9p1Ni4TZqyn0tnXl2Kmmtx0J8l0mcxnaEr0Sw2Jcd1rSPzntoLClTAt6
 4Kr1kkZ0L3NFVbsI2qKX7YNUqEa4GNg+7Sen7qKkOnTjxkGxP7UCkN1B9rMiX/56MvDi
 u16+azW6pYWnyvGCi1ETeW2zejm/PKQCPd3TACCr6J0ouQq+Dn/THCdrSussyfTvWdC7
 sz6Mw1UIiz5QMhiao4tGOTIPG6W951EGniBg8vY8EObNhxnZg19abfC83sR7b1out7Ji
 Mtug==
X-Gm-Message-State: AOAM533NOE/2GBjJtY9Sif0GNtbv9kiL+YqR3oRxPbbHiGigSrOm+2El
 Bg/xcidoDj0vWJN3fjOk4/r/f6ZG8GgoJA==
X-Google-Smtp-Source: ABdhPJxhsvRW3v+zrvOebXyKVredO5FCmhgmS1lkDZIvenC/aYsSzP3zHXlvcArWWKvhynF18VCdNQ==
X-Received: by 2002:a63:a547:: with SMTP id r7mr15162795pgu.186.1616223211846; 
 Fri, 19 Mar 2021 23:53:31 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:1ce8:18d9:6e3d:8c29?
 ([2405:201:600d:a089:1ce8:18d9:6e3d:8c29])
 by smtp.gmail.com with ESMTPSA id i7sm7513423pfq.184.2021.03.19.23.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 23:53:31 -0700 (PDT)
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Jonathan Corbet <corbet@lwn.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
 <871rcg2p8g.fsf@meer.lwn.net>
 <CAKXUXMzwTp1H_vokVEAJSnmm7jNHfWzhhmLfpcrrBD9b8ak+dA@mail.gmail.com>
 <878s6kto3g.fsf@meer.lwn.net>
 <CAKXUXMxWOvM5HRwmAAWEsqQc2k6_ReqRw0uD=VANLO5D7OpFtg@mail.gmail.com>
 <87o8fgpbpx.fsf@meer.lwn.net>
From: Aditya <yashsri421@gmail.com>
Message-ID: <99a21e10-266e-b997-7048-c29a570afe0b@gmail.com>
Date: Sat, 20 Mar 2021 12:23:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87o8fgpbpx.fsf@meer.lwn.net>
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

On 18/3/21 11:48 pm, Jonathan Corbet wrote:
> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
> 
>> Yeah, and as this line-counting is really just a poor man's
>> heuristics, we might just be better to really turn this heuristics
>> into a dedicated cleanup warning script, then we can check for more
>> indicators, such as "does it contain the word Copyright" somewhere in
>> the kernel-doc comment, which tells us even more that this is not a
>> kernel-doc as we would expect it.
> 
> I really don't think we need that kind of heuristic.  The format of
> kerneldoc comments is fairly rigid; it shouldn't be too hard to pick out
> the /** comments that don't fit that format, right?  Am I missing
> something there?
> 
> Thanks,
> 
> jon
> 

Thanks for the inputs Lukas and Jonathan. I shall try to come up with
something.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
