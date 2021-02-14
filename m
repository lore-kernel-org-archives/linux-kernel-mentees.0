Return-Path: <SRS0=zhe+=HQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE2EC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 16:50:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8037B64DCC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 16:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8037B64DCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3526D6F4C9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 16:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wy017FgYVrIH
	for <linux-kernel-mentees@archiver.kernel.org>;
	Sun, 14 Feb 2021 16:50:50 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id B4BE36F527; Sun, 14 Feb 2021 16:50:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id B71886F4C3;
	Sun, 14 Feb 2021 16:50:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 923BCC0893;
	Sun, 14 Feb 2021 16:50:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AC12C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 16:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 037CB868F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 16:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrsXcbBj8uba
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 16:50:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1289386891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 16:50:31 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id o15so3607883ilt.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RQt8yVU/JSJ+zSARecCze2UslviU6cjkgAOHLyV02Ik=;
 b=QP37LpAwqScHRWG8o2ZzjNl1f9d+wXTQ+2M7aDILC1OtvwSBUXgTmOdAEBErk74mkw
 l9I7/2cxb/TlEdVoKw/hGL0G6gR5m3VXEmt/QsixKO3SZlzumCzg3FaNGBlAYygeil/A
 LGbjgMt0TJLiJRcIqsSkev/48JWPfLjqm64z0PutboOBKPcKZ3FD9R6FrclNSQ1Y4TM7
 6eKWaKsz2GIR5nBtjbX3Q/C28B9UfQB6njs0eehmern/pBq3yc690ryM/AIRWRdywghR
 C1ebxWHwP1nCNbSw3UQsaHpADhk73CKwk1/V++I1hPKLPwFBTMxCaNsGsogprBBOrA1O
 UKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RQt8yVU/JSJ+zSARecCze2UslviU6cjkgAOHLyV02Ik=;
 b=LVRsfJv8p8kK+QqaDxUWSQE8kkyl6PsMmxDlydYzd7fNHmF2MyaZEyfe0hr48BrGzw
 olZHqIRZbsf+WNiY/hr30bwGSA2LEotKxkjeoTeruLSfh7UTC2FNISsaXEjgAUnYZIyF
 w3UKyiCk9BufpcpqydCdLLI9Hei00BTFxIHGfnRoeyDFtLyKXmKY6E1l4uUaA8ssRohY
 nJVu/f36KAGSFpS6YhipvMROrPDDTiWWcjnI7UukF69qa3j4eJGT2Cio9THO9qGR/hqR
 xt7OSMCovMCaTFgqIniE493zjIaoWGOE50kbow6022hdnAXQLQIn6ps/lzIp5xDDYtHZ
 Wi5g==
X-Gm-Message-State: AOAM533AeHA+hFSpbSV2CpyA62S0lfViMaIa2GEGFXSO5M39yzEZ1RmN
 LsgSAklfe37VRt4i8y2/Y1OWgKx66XSZJ8qaq+I=
X-Google-Smtp-Source: ABdhPJwDONAa0VCILmNmAlKvOrCqItkc6IAFqAAhrnYrytw0NRswP+tmAVM1XIlzLN6V6N0I1LhqTssox75D+ovO/s4=
X-Received: by 2002:a92:d1c9:: with SMTP id u9mr9993290ilg.125.1613321430187; 
 Sun, 14 Feb 2021 08:50:30 -0800 (PST)
MIME-Version: 1.0
References: <CANDtkxs5eJ3Rc1pxBfTnvHZbxpAFmZH97dxchbSqtHSb0hey4Q@mail.gmail.com>
 <CAKXUXMySAPVA+gHQvg0nUQyKXHOOMtYwmEr1rGn=8C+DbNo+5Q@mail.gmail.com>
 <CANDtkxv+u75ZL3s5K5Q8kns4aNhW3e50V36_u6C_Anma3Od-Uw@mail.gmail.com>
 <CAKXUXMyu5aNSojudH+7rBPOShtisPjXG9T9rzhm60ORmai35pw@mail.gmail.com>
 <CANDtkxtKncpeN5FVgEdGfavXy87MYdCW+-4wUjKuQ3BPOwwUnA@mail.gmail.com>
 <CANDtkxstAvTg-pma6PFXRZcFC6nQwXffKpr4cwdrZg2hOBrHag@mail.gmail.com>
 <CAKXUXMy+3C_nBd2_3g=wNgRWNEPD5UzOU5KgY4qL1=KvfRn-vg@mail.gmail.com>
 <CANDtkxvn_Xgwr+vKbiHC+bisFv860myKN5g9VZ8YiwJ_wt7zfw@mail.gmail.com>
In-Reply-To: <CANDtkxvn_Xgwr+vKbiHC+bisFv860myKN5g9VZ8YiwJ_wt7zfw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 14 Feb 2021 17:50:19 +0100
Message-ID: <CAKXUXMyboDdddS7artMNo4YRVbabRVt8z4QcbBwa5af64fkU3w@mail.gmail.com>
To: Divya Goswami <divyadeepti2000@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux Kernel: Evaluate and Improve
	checkpatch.pl Mentorship Program
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

On Sun, Feb 14, 2021 at 2:03 PM Divya Goswami <divyadeepti2000@gmail.com> wrote:
>
>
>
> On Sat, Feb 13, 2021 at 1:02 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>>
>>
>>
>> On Sa., 13. Feb. 2021 at 00:34, Divya Goswami <divyadeepti2000@gmail.com> wrote:
>>>
>>> Hello Lukas,
>>>                    I have been studying the checkpatch.pl script for a while now. And as the first task was assigned, I have successfully run a lot of patches through it. Most of them gave no errors/warnings. Those who did so far, have been collected (and more to be collected) on my github repo: checkpatch.pl-results
>>> Before I proceed further, I wanted to make sure whether I am uploading the files/outputs in the desired way you wanted. If the file naming or the hierarchy or anything that should be worked upon, do let me know.
>>> Till then, I continue to work on the given tasks.
>>
>>
>> All good. It could be that you observe different results when you run checkpatch in the kernel git root directory compared to the setup you have now by just copying it into a different directory.
>>
>> But the task for now is to just run it over the last release, so e.g., from v5.10 to v5.11 (which probably comes out tomorrow afternoon Pacific Time) and create statistics on these results. If you got that, we can start finetuning.
>>
>> Please continue.
>>
>> Lukas
>>
>  Hello Lukas,
> I have analyzed commits and got the lists alright. Also I have analyzed the errors and warnings generated by them.
> Please do check my repo: checkpatch.pl-results
>

Looks good. Too bad that you cannot run on a large dataset.

The next task is to look at three types of warnings you encounter and
describe the purpose of the check.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
