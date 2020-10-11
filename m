Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1DCC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:32:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A7D2078B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:32:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnGrWdKq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A7D2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A893485B99;
	Sun, 11 Oct 2020 18:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uxSWeJt9GmO; Sun, 11 Oct 2020 18:32:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4E06685008;
	Sun, 11 Oct 2020 18:32:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32886C0052;
	Sun, 11 Oct 2020 18:32:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC482C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E863A875EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKMl83PHGpOp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:32:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3973C875EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:32:54 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id g9so11856837pgh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 11:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0nBSwUP0/nh4c1VTCbemBuRSryKJbMShtl3MID456pw=;
 b=fnGrWdKqxkuasgu/CaJd6Ff0yDlee7v6l91qDpVFw7URCHZKUQh/5n//oY1fr+7TLk
 Pl3QPvHpPbIR4Yu3vvcbvSVABWiTy0KAJwD4hjP+Zhp45D4ciOqbbA50H+4d7MpQ74Ra
 /RHTnJVGI9BU67UeeuMfnUOFXwH/F51z7lzVROeYuYtPwimUrvFCEnlPaq+k2WH6aGii
 R3RIk96X5NUXTfocmXnqxtxdsdQyykD9ciSz+vNoc5RyDMxxiScmiOvEXonwfDrM6m9I
 YzN/qnqU70DiYP8kKfrVcbVTa4AWmD7VaLY1+VSf3xdMI4a2yLz9s1pcy2HMjPLH97i0
 wOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0nBSwUP0/nh4c1VTCbemBuRSryKJbMShtl3MID456pw=;
 b=f7ZGtfn/z+YwcerijE2uZdEZ/cVQl8rklVpR9UAcdEs//z+WmdbZCIehhEGY6syMEf
 bTP+JMyOUisum8fkwGuyN4sbNg8WVjE22alWhEy7IZBj3GnL3iYEq1mGaNng4gIVuZ0d
 VfXVr7kRwHWe8vvSxWTsRWI3sCB7z9JnRRv8e7oxiNndiiDVeIuOUwMAjBB0mkXTEn0O
 WR42zhTg/Q30b3D/RZsXd2RYHWn5g79iPko7LWH5dU9M1b4g6adU3xhGCjH8mhep+sb6
 3P+BeFsEwpK6IMZmlOvnOv2HJ3/O26IRcsfqx6DsPZnfhHNKMsQsBMZL+84Pz2bxg8AO
 fiCg==
X-Gm-Message-State: AOAM532Pyxftbj8oV7776X7YLf+DA0DRY7o+XeQDSOpgr9Knak6LlEYD
 PwowSg5jxzRykJCM6ya14DGOubW3g47gFQ==
X-Google-Smtp-Source: ABdhPJy1PLqSOS8cRFJyEJoHLOB5O2HEgs6RhTnExUuhVLXF5IEFmaL/r+hELeX8inhpQISjKFfyYg==
X-Received: by 2002:a17:90a:5881:: with SMTP id
 j1mr6815865pji.56.1602441173269; 
 Sun, 11 Oct 2020 11:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id s77sm17402756pfc.164.2020.10.11.11.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2020 11:32:52 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201011162123.1151215-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010111946390.5535@felia>
 <28381616-fb42-4efa-7a5a-7127e1a3f794@gmail.com>
 <alpine.DEB.2.21.2010112017490.412@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <3a27184a-0bab-92e5-1d86-a74bc699ca57@gmail.com>
Date: Mon, 12 Oct 2020 00:02:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010112017490.412@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On 11/10/20 11:49 pm, Lukas Bulwahn wrote:
> 
> 
> On Sun, 11 Oct 2020, Ujjwal Kumar wrote:
> 
>> On 11/10/20 11:20 pm, Lukas Bulwahn wrote:
>>>
>>>
>>> On Sun, 11 Oct 2020, Ujjwal Kumar wrote:
>>>
>>>> checkpatch script checks for invalid EXECUTE_PERMISSIONS on source
>>>> files. The script leverages filename extensions and its path in
>>>> the repository to decide whether to allow execute permissions on
>>>> the file or not.
>>>>
>>>> Based on current check conditions, a perl script file without
>>>> '.pl' extension in its filename and not belonging to 'scripts/'
>>>> directory is reported as ERROR which is a false-positive.
>>>>
>>>> The script can correctly handle patches with mode changes and
>>>> shebang line if shebang is taken into account. So, along with
>>>> the current check conditions, adding the shebang check in the
>>>> check conditions can improve the reports of the script.
>>>>
>>>
>>> I think one of the core design decisions of checkpatch.pl is:
>>>
>>> checkpatch.pl can run on a patch, even if the patch does not apply to the 
>>> current repository version that is checked out.
>>
>> From our past conversation I remember about this particular point.
>>
>>>
>>> It solely uses the information in the patch, and does not try to guess how 
>>> it could be applied etc.
>>
>> I am fetching the 'shebang' from the patch itself (therefore I do not 
>> understand how does the proposed change violate that design decision?).
>>
> 
> Okay, maybe I misread the patch; so, where those the first line come from?
> What if that first line is not part of the patch?

In that case there might be a false-positive. But I tried to handle such cases 
where the first line is in the patch itself.

Okay, so there are total of 4 cases with file mode change:
1. mode change + create + modify
2. mode change + create
3. mode change + modify
4. mode change

the patch will handle all cases of type 1 and some cases of type 3.
Other cases won't be handled because they cannot be handled without 
breaking the core design decision.

I do have references to say that the cases 2 and 4 are

Which I thought is an improvement over current logic used for the check.

Correct me if I am wrong.


Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
