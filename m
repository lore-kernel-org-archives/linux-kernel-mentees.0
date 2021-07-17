Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB272C636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 07:55:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482936128C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 07:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 482936128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C3ED400D9;
	Sat, 17 Jul 2021 07:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3smAvPWCMkdo; Sat, 17 Jul 2021 07:55:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2E124400CB;
	Sat, 17 Jul 2021 07:55:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02CDAC001A;
	Sat, 17 Jul 2021 07:55:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92A82C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72A824162E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CN4py_vAEk3l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 960654162C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:55:21 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id g19so18690756ybe.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 00:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j4+6fCH12e/6/UAxFXR1wj++CpJJlKXjnH5nNKn+j4o=;
 b=a7uhKpJPYuYOsg9zAETy1Z2lVPCrzoyZ0TDXrSr/CYoWhvI59TQfHEKnTNlUpP/LXF
 V1ZG+yqBcUbk+nT1Kt8uJ3dDlogU3MKFR+kl2TBeBDP/7TS8+8xnh+z6VRSk8KUIGN7D
 0dGqCc1U/65QzqarrM4GpQpUKV77xm7TNOODUdLL67WDsdbUrtmZsFkcV3KLiVxc2dXI
 eJ4b+6eKiVDqNYfAytIQ+IZYo1Gb9WM7yYjg3zcYh41ax2iILAJZCIijgIEedEcObjNz
 PYytvx4c6GfA81UEd36hldyDmqWdr3nwlBOR8jVJ6bh5R7uoYPqnH0SCsZFBCRtXdn1v
 56zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j4+6fCH12e/6/UAxFXR1wj++CpJJlKXjnH5nNKn+j4o=;
 b=Jrkd7gInsjpvHX3/lkUkLxRmfQiXCtyU443jTndoMUPNktMSj+WapDKgtL2uqIpEmE
 4R3PGdIonXam0vQahosErI6GIlBFO2yEZFG9zgdLbrg9TiT/RxBR9wATdB6HBIx/CXnW
 TXWdjXFxacy4dMc2XEz++jMgbkEkP9JDQcHudzoZPC2B6uESyovzAM6COUatkoeRbi8p
 F8dImbnEvOQ/ZhKnxOYxYgIQsPAnkIgGjvUBJETggVL2b4E31/4I5/CjvYD+ZHGS+neG
 8xMI3MGjPFsZ1XaMr7NPVAj6zE6jhVUJizyGnQAMHSgYRabcKVDYsO46ZTJYOUZYxnLd
 o2GA==
X-Gm-Message-State: AOAM533aSTL6SvN4ejMD2dsVOoMG6HSvXRNP51icZ2U/sRemO/WvY3RW
 an/sRF1hVXMNYZ5raZdkPf79lZjHL3sCrID/kyE=
X-Google-Smtp-Source: ABdhPJzD93P063pwPpdwhruSVaYsYrebkobl2F9Rv3ph/gCxhB4EqGrLjkVFvb7KDn21PI8borB7gofxK//Z7H8MgnU=
X-Received: by 2002:a25:b948:: with SMTP id s8mr18031328ybm.281.1626508520465; 
 Sat, 17 Jul 2021 00:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQwXtjwRjYQuRot5DzSzz=s_j_tCwv+Mt8=u4zmeGqNKWOphQ@mail.gmail.com>
In-Reply-To: <CAEQwXtjwRjYQuRot5DzSzz=s_j_tCwv+Mt8=u4zmeGqNKWOphQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 17 Jul 2021 09:55:10 +0200
Message-ID: <CAKXUXMwzoBHCeyusfE_sNF_TrcHRkE774zJMk3pR15-AT_WwMg@mail.gmail.com>
Subject: Re: Regarding LFX Mentorship
To: Ashutosh Sharma <b18010@students.iitmandi.ac.in>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Jul 17, 2021 at 9:28 AM Ashutosh Sharma
<b18010@students.iitmandi.ac.in> wrote:
>
> Dear Sir,
>
> I am Ashutosh Sharma currently a senior studying Computer Science and Engineering at Indian Institute of Technology Mandi, India. Sir, I got to know about the Linux Kernel: Mining for Maintainers project from the LFX Mentorship Program website. I am really excited about the project. I have applied for the project on the website. Now, I am writing this email to you regarding the mentee tasks.
> Sir, I have been an intern at Amazon where I worked on AWS,  Java and React. Other than that I have also worked as a student developer in Google Summer of Code 2020 under The Mifos Initiative organisation. Currently, I am looking for more opportunities to challenge myself and learn new skills.
> Hoping for a positive response from your side.
>

Please always CC linux-kernel-mentees@lists.linuxfoundation.org.

Thanks for your interest.

For the mentee selection, please work on the following exercise:

First, download the kernel git repository and compile the kernel with
the x86-defconfig build configuration.

There is a file called MAINTAINERS in the root directory of the git
repository. Read the introduction at the beginning of the MAINTAINERS
file and understand the content in the file and its organisation.

Explain in your words: What is stored in the MAINTAINERS file?

Now, search for specific MAINTAINER entries; Please answer: Who are
the maintainers and reviewers of the following sections?

ACPI PMIC DRIVERS
ADF7242 IEEE 802.15.4 RADIO DRIVER
AFFS FILE SYSTEM
DOCUMENTATION REPORTING ISSUES
MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
P54 WIRELESS DRIVER
SCTP PROTOCOL
SOUND - DMAENGINE HELPERS
USB "USBNET" DRIVER FRAMEWORK
VIRTIO FILE SYSTEM


Please let me know about your answers and always send your responses
to the linux-kernel-mentees mailing list.

After that first exercise, exercises 2 and 3 will follow.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
