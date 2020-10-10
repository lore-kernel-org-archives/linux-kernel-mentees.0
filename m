Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1940EC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 07:29:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A48B82073A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 07:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSsTJ3I9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A48B82073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3D01887753;
	Sat, 10 Oct 2020 07:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4WkeL544L+t; Sat, 10 Oct 2020 07:29:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 99E9587728;
	Sat, 10 Oct 2020 07:29:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CD1BC016F;
	Sat, 10 Oct 2020 07:29:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EBF3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 07:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 761FB87728
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 07:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVTSFcISUrXK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 07:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B63F687753
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 07:29:18 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id f19so8807391pfj.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CGaRnUXGGA+4gEMvMrlGGBPIeMqxnDwVXY+Ah17vxLA=;
 b=TSsTJ3I9KNL0rzGvFXhmgm94hUPSSolCBOZL/c4RsSJyDJ98vRHs0GdqhE/5ysb4Sg
 AX/sKGh4Yg6Ks8nVJUwmw5T9SezcRS3UdxShu1RtZ+pGGgApolzPGfmE2lhdEA2TryFw
 ItgX9zItj8vCfpuimo2pya/8cTwunHDyizE5JgqArjRI5PJBS3O59IHARlv3OUus4+we
 Ju8y0cnJFWbX2RQED4/I0BrgSp2woqmcAMJuEENUEZX8LDxlnX0QPYkKA07iYCPl8DuG
 97wP3tVjff3EJFllm02TQlnLTQi+xgBkrqVRs0v5ZCwDg6BYz49oIPNfGBTLkHWNngMZ
 EboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CGaRnUXGGA+4gEMvMrlGGBPIeMqxnDwVXY+Ah17vxLA=;
 b=QIen0AiMVFd/J+JfeUnVzpDSqamSFkhkJWDhIWww1bpfCuCtoX9FadYJWfsR+pu3G8
 ACfccgvY8GAyME5MLiQXwLuiL1AZUq8geE/+R+lLVb/v635yuAyxACI25xTmifpfF4g0
 YdnzEL6bFS/DGDk0sJrSa+JkT2kEWBmYjGji4m96zYSS4mkDhPtkPprrEe77Pq2VVYe1
 l62YlwPf0S52sDe5qtSzSfz/cnla+uOhTMATj+aIEh8MJ5ZyryMzn4Z8sNCdLH7jYC/i
 5Bw/3CHue2mLNg4eaOPF95YVa+5SM6IoTbQUPPC0InjItqTjHn3f6Bq2ZZ4HYOkN+OGI
 TBXA==
X-Gm-Message-State: AOAM532atmzVMVHqV+Zc6oI2CaGIeQw21ynjPfRkc4vgJ5b0FIrR5mkE
 mDjP0PlaUsMX4IIennxbqWM5IiyZpvFkcyLdVP0=
X-Google-Smtp-Source: ABdhPJwlXmxcTfrJh3wNGrdy2Xxb8lFF+gr6n/eqqGy4Q1xdCUefYbC8xcsMrs12A9H+atR+fNX8zQ==
X-Received: by 2002:aa7:98ce:0:b029:152:5ebd:428 with SMTP id
 e14-20020aa798ce0000b02901525ebd0428mr15174034pfm.4.1602314957423; 
 Sat, 10 Oct 2020 00:29:17 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id m6sm13766634pjn.47.2020.10.10.00.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 00:29:16 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20201009162030.293781-1-anant.thazhemadam@gmail.com>
 <20201010070007.GB132110@kroah.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <b84879e9-425e-6354-d21a-cd7c5d237be5@gmail.com>
Date: Sat, 10 Oct 2020 07:29:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201010070007.GB132110@kroah.com>
Content-Language: en-US
Cc: devel@driverdev.osuosl.org,
 syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com,
 Ian Abbott <abbotti@mev.co.uk>, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] staging: comedi: check validity
 of wMaxPacketSize of usb endpoints found
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

Hi,

On 10-10-2020 12:30, Greg Kroah-Hartman wrote:
> On Fri, Oct 09, 2020 at 09:50:29PM +0530, Anant Thazhemadam wrote:
>> While finding usb endpoints in vmk80xx_find_usb_endpoints(), check if 
>> wMaxPacketSize = 0 for the endpoints found.
>>
>> Some devices have isochronous endpoints that have wMaxPacketSize = 0
>> (as required by the USB-2 spec).
>> However, since this doesn't apply here, wMaxPacketSize = 0 can be
>> considered to be invalid.
>>
>> Reported-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
>> Tested-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>> ---
> You sent 2 patches with the same subject, which one is the "latest" one?

This patch (that you have replied to) is the "latest" one.

> Please always version your patches and put below the --- line what
> changed from the previous version, so that maintainers have a chance to
> know which to accept...

The other patch (with the same subject line) wasn't supposed to be sent out.
I realized there was a coding style error in that while sending, and cancelled
sending it, but it got sent nonetheless.
I would have included a v2 tag in this patch itself, but I didn't realize that the
previous one got sent until afterwards. :(
I'm sorry for that.

> Can you fix this up and send a v3?

Shouldn't I resend this patch as a v2 instead? Since there wouldn't be any
changes from v2 (this patch) to v3 otherwise (unless of course, somebody could
suggest some more changes that could be made to this patch itself).

Thanks,
Anant




_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
