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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28536C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 13:33:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA46E61970
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 13:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA46E61970
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB606075A;
	Sat, 20 Mar 2021 13:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqn5XvZQj00n; Sat, 20 Mar 2021 13:33:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F2ED60726;
	Sat, 20 Mar 2021 13:33:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2734BC000B;
	Sat, 20 Mar 2021 13:33:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21E22C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 147F54034B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CoNYMsahHJpq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:33:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E26540341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:33:13 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so9530824pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zel7VqglAbcHE+3PfYSn3C2SSRsn+gUENwKUKP8d3qQ=;
 b=q849W2hb8iEUQSYVDml8xNerfLqjVM6pFSoaH9UQvE023n9zur+gEmAzmxdGYuZlu3
 unuM06eYUZLjfYekvNf+Gbe3I5TL5Jn1jGdFjX2nwWtJxqdqcohdRX7/L3qUROKxQVx/
 gtLCQGOmchV/YYXcsljpbSGQ0o2UO+tdwsaK581Z1mHe2NeiaMnO6SeNpEtILdGg7mAf
 TLPbLqCUooDmf4eGHK5mZNpdyacAnSy6tepkUTgTANu7nDJoWEB6eaIz/fAb0jtgtoin
 xVOeBpPdzYIf+KJua9VPW5pJD6zkkUwXEVgyzfg3dLRuRtemppPnwsfJF2ROoEz0BIMw
 IVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zel7VqglAbcHE+3PfYSn3C2SSRsn+gUENwKUKP8d3qQ=;
 b=S6cYrWRBqpAq91BNdcvuWJ5MvhsMsfsEr7kkJqnpqLwNpizMSY10zmXPJ+MnZ0Ypl2
 DzasnbvU9t9EKKWkkMrOfGIlZYlqUhDn2vucDKuju+iKS76tjxzEGx9ZzERyDHRY9Nl9
 vm1phVku+zFwAyFAt5OZxovn0lU10kCGx6rgBxWWCpfw6kW9GheFK08Fb6fcWteON28g
 FfmyGtFJ0+s2VioXlTUVxwqtSJRkziETLy2QzAVfS6d3d77FiBE/RIMWzyR+agMJRerY
 n/lpx8KcxArmAQl9V2dFU3R4Lub1gIoSLv8+w18OcCMkFwBNtXILOHIKChJqbwAdHcXF
 4Fbw==
X-Gm-Message-State: AOAM5302oNoqLj2c0KWdgO1OIZlhmLjQe7S3iwlPsIy7sbLk8TlWt3FP
 dEG8An5eTwLOB+ODkfdOPKwYOCnoSQr9+Q==
X-Google-Smtp-Source: ABdhPJybaAFXeZ6T0sj4b5mmasN9VIRTo3lbhyUoFsf6/R1eDA0zQAxvynj0PQ+s4govMuXMZgnYiA==
X-Received: by 2002:a17:90a:e7cc:: with SMTP id
 kb12mr3628046pjb.31.1616247192421; 
 Sat, 20 Mar 2021 06:33:12 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:1ce8:18d9:6e3d:8c29?
 ([2405:201:600d:a089:1ce8:18d9:6e3d:8c29])
 by smtp.gmail.com with ESMTPSA id p17sm8386881pjv.49.2021.03.20.06.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 06:33:12 -0700 (PDT)
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
 <871rcg2p8g.fsf@meer.lwn.net>
 <CAKXUXMzwTp1H_vokVEAJSnmm7jNHfWzhhmLfpcrrBD9b8ak+dA@mail.gmail.com>
 <878s6kto3g.fsf@meer.lwn.net>
 <CAKXUXMxWOvM5HRwmAAWEsqQc2k6_ReqRw0uD=VANLO5D7OpFtg@mail.gmail.com>
 <87o8fgpbpx.fsf@meer.lwn.net>
 <99a21e10-266e-b997-7048-c29a570afe0b@gmail.com>
 <30051ed8-33e4-a303-199c-f4bdcb0e448a@gmail.com>
 <CAKXUXMyQRY9GC7sUG+_W5hQe3EFdvxKrYTEO7JL3E5LD3cCPKQ@mail.gmail.com>
From: Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <9f5d3dc7-ed79-a420-346a-914004964569@gmail.com>
Date: Sat, 20 Mar 2021 19:03:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyQRY9GC7sUG+_W5hQe3EFdvxKrYTEO7JL3E5LD3cCPKQ@mail.gmail.com>
Content-Language: en-US
Cc: Markus Heiser <markus.heiser@darmarit.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
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

On 20/3/21 6:51 pm, Lukas Bulwahn wrote:
> On Sat, Mar 20, 2021 at 1:45 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> On 20/3/21 12:23 pm, Aditya wrote:
>>> On 18/3/21 11:48 pm, Jonathan Corbet wrote:
>>>> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
>>>>
>>>>> Yeah, and as this line-counting is really just a poor man's
>>>>> heuristics, we might just be better to really turn this heuristics
>>>>> into a dedicated cleanup warning script, then we can check for more
>>>>> indicators, such as "does it contain the word Copyright" somewhere in
>>>>> the kernel-doc comment, which tells us even more that this is not a
>>>>> kernel-doc as we would expect it.
>>>>
>>>> I really don't think we need that kind of heuristic.  The format of
>>>> kerneldoc comments is fairly rigid; it shouldn't be too hard to pick out
>>>> the /** comments that don't fit that format, right?  Am I missing
>>>> something there?
>>>>
>>>> Thanks,
>>>>
>>>> jon
>>>>
>>
>> Hi Lukas and Jon!
>> I have a question, should I clean up the files with '/**' like
>> comments in only header lines? Or as we are planning for making it
>> generic, for other lines as well?
>>
> 
> Aditya, of course, if you can detect and come across some unintended
> '/**' comments in some files, clean them in the same go (as you did
> with ecryptfs).
> 
> I am just worried that if you extend it to the fully generic case,
> that the list of cases simply explodes: showing many 1,000 cases
> across various 1,000 files that need to be cleaned up, and such
> clean-up work is just too much to get done by yourself.
> 
> The current list limited to comments in header lines seems to be a set
> of patches that you can probably get done.
> 

Sounds good, Lukas.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
