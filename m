Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09622C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 18:05:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F873224B2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 18:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWsO8rw+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F873224B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D57E8204C6;
	Sat, 10 Oct 2020 18:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SgTmSBFnAyGA; Sat, 10 Oct 2020 18:05:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 50925203AE;
	Sat, 10 Oct 2020 18:05:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33646C07FF;
	Sat, 10 Oct 2020 18:05:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A528C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 61B8D872CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TK0ghUkcDbUA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:04:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4C5F9872C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 18:04:57 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l18so999517pgg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 11:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=G7Wfxd5rme1m7TClufp4VEut1kgj/lI9DWLimurfbPU=;
 b=LWsO8rw+FZR5RRECdnqbt7diUHNUjZdWF2oU2FMh0RyNEgdVxtw0fHHKEPiC/TmnF9
 j+lCXbh6uGaWIRSCzQoH3VogVmXxU0Szx4+bFHsB9bb/2F6rsOxPzirPJshPMdWoJP6Q
 CPvEXYrpZ+R7z2Hpv0HEpDoDGCrSctQpIsvrgVB/JbkttjjPTEhELFLz0t6adTLCtAfa
 +EbbDH6FYZ3txeF2PulBp/mzRnwj9vglchUGBtR2vD6XcIvoig6Xh7f7N9Abv10xBlvi
 4odPi5MLdHJjxReojngmNLMuO7zbszXE6I4SQEmDU3FIoEIb1W99pNyZXwJ0BB+lFj2C
 utKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=G7Wfxd5rme1m7TClufp4VEut1kgj/lI9DWLimurfbPU=;
 b=Adh7loSnqM7tM2/fMUmZNmb9BGud6ugTPaH7hwLXjK8U1XezgBNkQ2bvY0F26btHLj
 8+uHlWIqwchVN1hwFuqrXtpojFeTlJ4Vm9fwt0SFXadNTEEGm3aSSoHXxOCLrhyi+WkI
 akdF3myjOn15KKCjJFcwFHxGM31Xc9+LYBnxpA0lFO0VQheMzZFqDP2NFndXdv5oszeJ
 TrrJ5nNrO6g55P5LmJFNPXUBmABKerhU7WVl62ZsSDdjaX+LVrGfkhhAY206HcjxUUSA
 mEV0OTN9RZMQF6OS0TcshBthcu5ZL7QlsK5dpza9U4+79MKJWRpFkBB2VYqK9c1rIFYz
 gbIw==
X-Gm-Message-State: AOAM5326PXq3yRQ5sdz48XDlhltM4ABFfaW5pqHneYASLZw2LgnCvQdX
 RMpew5XWPU62raCC5h9P8aA=
X-Google-Smtp-Source: ABdhPJxPOFAi9ocv/veCG4BPSrVt24N8PY2lvwQ4bnT1hXZ0f8ZFHG2J43pWpbWhkBhgpK3kdJP0uQ==
X-Received: by 2002:a17:90a:aa18:: with SMTP id
 k24mr11040344pjq.231.1602353096497; 
 Sat, 10 Oct 2020 11:04:56 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id t7sm16189012pjy.33.2020.10.10.11.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 11:04:55 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201010095302.5309c118@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <0de8e509-7ca5-7faf-70bf-5880ce0fc15c@gmail.com>
Date: Sat, 10 Oct 2020 23:34:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201010095302.5309c118@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
Cc: Petko Manolov <petkan@nucleusys.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: rtl8150: don't
 incorrectly assign random MAC addresses
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

On 10/10/20 10:29 pm, Jakub Kicinski wrote:
> On Sat, 10 Oct 2020 12:14:59 +0530 Anant Thazhemadam wrote:
>> get_registers() directly returns the return value of
>> usb_control_msg_recv() - 0 if successful, and negative error number =

>> otherwise.
> Are you expecting Greg to take this as a part of some USB subsystem
> changes? I don't see usb_control_msg_recv() in my tree, and the
> semantics of usb_control_msg() are not what you described.

No, I'm not. usb_control_msg_recv() is an API that was recently
introduced, and get_registers() in rtl8150.c was also modified to
use it in order to prevent partial reads.

By your tree, I assume you mean
=A0=A0=A0 https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git/
(it was the only one I could find).

I don't see the commit that this patch is supposed to fix in your
tree either... :/

Nonetheless, this commit fixes an issue that was applied to the
networking tree, and has made its way into linux-next as well, if
I'm not mistaken.

>> However, in set_ethernet_addr(), this return value is incorrectly =

>> checked.
>>
>> Since this return value will never be equal to sizeof(node_id), a =

>> random MAC address will always be generated and assigned to the =

>> device; even in cases when get_registers() is successful.
>>
>> Correctly modifying the condition that checks if get_registers() was =

>> successful or not fixes this problem, and copies the ethernet address
>> appropriately.
>>
>> Fixes: f45a4248ea4c ("set random MAC address when set_ethernet_addr() fa=
ils")
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> The fixes tag does not follow the standard format:
>
> Fixes tag: Fixes: f45a4248ea4c ("set random MAC address when set_ethernet=
_addr() fails")
> Has these problem(s):
> 	- Subject does not match target commit subject
> 	  Just use
> 		git log -1 --format=3D'Fixes: %h ("%s")'
>
>
> Please put the relevant maintainer in the To: field of the email, and
> even better - also mark the patch as [PATCH net], since it's a
> networking fix.

The script I've been using for sending patches in had been configured to CC
the maintainer(s) and respective mailing list(s). Sorry about that.

I will put the relevant maintainer in the To: field, fix the Fixes tag, and
mark the patch as [PATCH net] as well and send in a v2.

Thank you for your time.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
