Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA8AC47423
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:15:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA1D21531
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wf/O/eFH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDA1D21531
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76B4286BCF;
	Thu,  1 Oct 2020 07:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hp5xG72p8AaL; Thu,  1 Oct 2020 07:15:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9BEAD86786;
	Thu,  1 Oct 2020 07:15:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94E51C0889;
	Thu,  1 Oct 2020 07:15:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C88BCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C499987292
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uHtj1gT41ZqE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:15:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 583A28728C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:15:46 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id p21so1196111pju.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0N5ZbXBtnwntldT0m2lp5CvoYnPX3c9VsysiYC8gncA=;
 b=Wf/O/eFHld0m4dgAc2lBd4g94nABMzXLttE5nglWfZbSY1Bwn2xPmmDSj+8yBd6R86
 ctzx37NZ+io9ght7axHtT5wOHUtDJk6HuUiJnWBfkw+Q6XQzCTtjknfkRBp8X4CgLugs
 jPoBSyH8EUISkGEeGJ33hniI7PO/HCjBSoxN/93azr7ITT32eJ1Y4PZxoSuTtFMxv/Lu
 zHfGdTaJmSCr8BMtKFPS4NGy6hymKvRiLQXmA9d00pRLdctpi4UyitZGLHaSmQ5mZLKx
 KS9/HrsYNwc9tylLznrUpeNRwPBsB89r/k2sisjOxU40kLgMClHgta0VuyOqPaq2EXFq
 Be1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0N5ZbXBtnwntldT0m2lp5CvoYnPX3c9VsysiYC8gncA=;
 b=YjYkv6SuimOhn7DhI9lU1s2d5m4NJtNOWJuuOH+0fr/sxUWPO8P7QAiS6wFMg2LWTO
 iQOIImU6S9Tc4LA8GvzhRhSZwwlJ7r3R5/HGvis/c1RRWkh+6q1aI0iFu0LfQLBf5YSJ
 EIbLVrMXnX4FR6DVX+G9qrMl8Q/VnaoIdGBD3glM0YrQrOWzmCGN1vBDNj9YiCEpzHgH
 wdQbKJFhvPXrVtHYi1M+2oOcyZl9KzXHEMSZ3b2ug3ML0vShbEg2SNKsWenP5apqvhPQ
 p+wIUKqwX7d4PS/wq1lwGyfZVeLpWwg2a2NClFjVuWRoF4x+a9Fcwo9N+OJap0D4Si9Y
 2CiQ==
X-Gm-Message-State: AOAM531b+650FcKoqra8pRmFLyfmA5cR9Q+aRjpKTYCliAROzHMm8xE5
 UpUX/MQC2DmnLGzwxyKB8bo=
X-Google-Smtp-Source: ABdhPJwCYIwkoRDM9VXxsFghIyxXpu3/Ulz3jhy7lk28eW/IrSpPAGt6H0gokLJ0ycahG//eg8jOjg==
X-Received: by 2002:a17:90a:71cb:: with SMTP id m11mr79030pjs.14.1601536545822; 
 Thu, 01 Oct 2020 00:15:45 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.212.76])
 by smtp.gmail.com with ESMTPSA id y29sm5372565pfq.207.2020.10.01.00.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 00:15:45 -0700 (PDT)
To: Marcel Holtmann <marcel@holtmann.org>
References: <20200929185815.12879-1-anant.thazhemadam@gmail.com>
 <9D145813-A4B8-46AB-A55F-54C4AF82FD19@holtmann.org>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <40cdb070-a170-e979-6564-8abb0113570b@gmail.com>
Date: Thu, 1 Oct 2020 12:45:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9D145813-A4B8-46AB-A55F-54C4AF82FD19@holtmann.org>
Content-Language: en-US
Cc: linux-bluetooth@vger.kernel.org,
 syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] bluetooth: hci_h5: close serdev
 device and free hu in h5_close
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


On 01/10/20 12:38 pm, Marcel Holtmann wrote:
> Hi Anant,
>
>> When h5_close() gets called, the memory allocated for the hu gets 
>> freed only if hu->serdev doesn't exist. This leads to a memory leak.
>> So when h5_close() is requested, close the serdev device instance and
>> free the memory allocated to the hu entirely instead.
>>
>> Fixes: https://syzkaller.appspot.com/bug?extid=6ce141c55b2f7aafd1c4
>> Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
>> Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>> ---
>> drivers/bluetooth/hci_h5.c | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
> patch has been applied to bluetooth-next tree.
>
> Regards
>
> Marcel

Great! Thanks :)

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
