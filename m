Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EB4C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 17:48:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 742632242E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 17:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obhnWjcC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 742632242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E7BF986277;
	Tue, 27 Oct 2020 17:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hlxDgiG9YXR; Tue, 27 Oct 2020 17:48:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 711288626E;
	Tue, 27 Oct 2020 17:48:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60080C0859;
	Tue, 27 Oct 2020 17:48:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5817EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4117286924
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDUPfDbcP2IS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:48:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2A35F84B8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:48:20 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id x13so1211716pgp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d+5OqQXvG1TBvL8sr/fgNgf/4uhecRVnHFmDstUsQDk=;
 b=obhnWjcCK9NOVm399uMZgWGWoMU1CXmFUDPBMAHga5uubTY5X4hN+GqPOwRvCa89kn
 8j7ccN1vK3fYGFp3cwejIPwh9J8HuKPlConP/tk0Xgut1PskftVKNgxyQCACjqe0KhQl
 5WlO6knutXTOacwjIlyWJ7+GR4n0b7a/Vpy1ExrWZ9Pdw+Js9/zQWWhjLrTDw8s6V9L8
 N2yJKbXY449J1aL+T7L1eBQFCfeeUciilTW8dx5AhSJKkpXZ9U/QNCIMSChuN6Al8SuB
 9XhzZQNan1XoVL6Gy/oWpwkKolBmum+Z93kyl/LvIypdING9eZvBuWs0cvF5rcqY2BLR
 0G7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d+5OqQXvG1TBvL8sr/fgNgf/4uhecRVnHFmDstUsQDk=;
 b=g5n74hViT5hUW5+BMc/22QUT9IUmBBuUoKNsfRLN8qPbUuiH3QsKiAUkK1O/NhizgF
 Jx/1a/4q5LztjG5y4R0UlLhsbjqD+KtyclVGoX1STapqyPfJrALmAafOjmnkB9jiV9AD
 iISSG+aEONWrtHcVDsSZ1kxGrdkYT1ZnNlhJ5SSZh2anzWQiBqc6HmFixwS8zP/t0Uky
 wlCPw4sOpQtZIZl0UDCieaykQbCbzlqSyYqWJ3MKVdGl0hs81epE5kncSfMCPW4XrXRY
 qzVhPufbXEkp1ODil0hy+eFzdFwW2C0DD/jb8sAc0z4Rsj9SsRLctk8TAfoMlp39zCyD
 vBvQ==
X-Gm-Message-State: AOAM530TKVTwYUnDPAR2+KSnTSaOQa9y/QY572yeFtZFlBfIed4kqiOU
 zG0QmrqiTN2t6lmC8mVcf0MH89dm8GG7Lg==
X-Google-Smtp-Source: ABdhPJxDrp6s48I3F78WM4sPHmLVvBpSE5ydmj01iNHXhB7djsjL7YcU9PD8AkcqGxOCSipn/V8Kew==
X-Received: by 2002:a62:1c92:0:b029:15c:aff1:b16f with SMTP id
 c140-20020a621c920000b029015caff1b16fmr2734068pfc.0.1603820899257; 
 Tue, 27 Oct 2020 10:48:19 -0700 (PDT)
Received: from ?IPv6:2402:3a80:407:f2f9:9c3d:78ee:4b7a:d94a?
 ([2402:3a80:407:f2f9:9c3d:78ee:4b7a:d94a])
 by smtp.gmail.com with ESMTPSA id 15sm2766123pgs.52.2020.10.27.10.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 10:48:18 -0700 (PDT)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
 <CAKXUXMzVn8qe7wOmo==r2z74X7VnhFnOpAdAUtJJcRNr==9Wog@mail.gmail.com>
 <3180d302-0b26-3bbb-4e7a-b19037a95ff1@gmail.com>
 <f6539e89-bb5f-d706-99e2-1f8577889cdc@gmail.com>
Message-ID: <f9526bbd-edc9-8367-346c-f6b29f2c63a9@gmail.com>
Date: Tue, 27 Oct 2020 23:18:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f6539e89-bb5f-d706-99e2-1f8577889cdc@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Mentee Proposal Feedback
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

On 27/10/20 1:34 am, Aditya wrote:
> On 26/10/20 11:31 pm, Aditya wrote:
>> On 26/10/20 10:19 pm, Lukas Bulwahn wrote:
>>> On Mon, Oct 26, 2020 at 10:11 AM Aditya <yashsri421@gmail.com> wrote:
>>>>
>>>> Hi Sir
>>>> I have made a proposal based on your suggestion for interactive
>>>> checkpatch.pl. Do I need to add more than one task in it? Actually, it
>>>> was exceeding the 1.5 page limit as you mentioned so I decided to ask
>>>> and get a feedback on this.
>>>>
>>>> Link of proposal:
>>>> https://docs.google.com/document/d/1GpyLzJwDkH06azgThZMnaFKvn8bwo6UI10em8weWjcE/edit?usp=sharing
>>>>
>>>
>>> I added comments in the Google Doc.
>>>
>>> We further would need to determine if you are applicable or not from
>>> the terms and conditions of the program.
>>>
>>> Also, we would need to identify which work you can realistically
>>> commit to. If you want we can clarify these points in a quick video
>>> chat.
>>>
>>>
>>> Best regards,
>>>
>>> Lukas
>>>
>>
>> Sure Sir. I'm free right now.
>>
>> Thanks
>> Aditya
>>
> 
> Hi Sir
> 
> Thanks a lot for your feedback. I'll fix my proposal by tomorrow.
> 
> Kindly provide me some time tomorrow(27th October), for the video
> call, as per your free time. As it is already past 1AM here, I may not
> be able to deliver my best currently.
> 
> Thank You
> Aditya
> 

Hello Sir
I have re-created my proposal as per your suggestions and also added a
rough timeline to it. Kindly let me know if you can access it.

Link:
https://docs.google.com/document/d/17ojyD17ZvcQZjP77a4eChSPKcm1iP7u_p_xmRWam1ek/edit?usp=sharing

Thanks
Aditya

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
