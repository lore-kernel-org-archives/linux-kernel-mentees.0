Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B86C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 12:40:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E9C2464E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 12:40:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYTwFit6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E9C2464E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AC9C086094;
	Tue, 17 Nov 2020 12:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1U-YFDkvPy7s; Tue, 17 Nov 2020 12:40:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE8B88553C;
	Tue, 17 Nov 2020 12:40:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6627C0891;
	Tue, 17 Nov 2020 12:40:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 554E7C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 12:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 42ED8859EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 12:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2yF2SqlCdL5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 12:40:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A0EAD859D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 12:40:02 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id l11so385056plt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3odGtP6YqiWcERjrWIEjQRdyQWBVS5tneCB0sDQNsyA=;
 b=FYTwFit6qAgitY4EBkb33j5zSymPpHNrhfj+vgw83Ar/FbxrEFUfaFXXWq/jRAQ8Rh
 92Adne5jwPGsc/lp1K3qCc82Qrf+cU86sdBk2oqFIPQ2swfOe42uc0SK/wInBcEoS+Rd
 RSoZU4pjZu9GIiA3g5yUroxTsArRg4mjlzjOsDyoI9tJPA8es7O2KONZkKOT41MX0G4w
 OmBpfPgUV95WoxMYdpmjn6fyZBiD/huZiF/2LAC+PFxPiHZlBjm49i2qXDSE+JoeFobn
 F/08eXi0C83BmqDoDArU1URSpXMyUnAPtA1BV5H6amZ9qV6OAHMGQ9HuD92fPoEBw+L2
 PyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3odGtP6YqiWcERjrWIEjQRdyQWBVS5tneCB0sDQNsyA=;
 b=Oz07VJG/1lnlHHXjK8kRJRXUM1cqQm1292DYXdG2guiU+jRsQfX3EDgOkCTFezdBXz
 UtrP24Gwr1ddaiDZ/eHfyeIdXvTwS7y+6GXhTsnJbqZtLVX3Ty7fsabUKN6iDX/bPUFF
 4V8RlRgGMJ5HY8zoL0BFaaTJJuvVgmcSdIKluCRpQrj1sdks2IpaJbSZ4G+xHQcrzHde
 l4p2qtfNlChKyTnT9/tMSdyZia9nehpEDG6hfV4nCZA6CN2hlAwTIodkboivRXFTD5Kl
 JXe1V9nVvNTWEY1rxzAuuMIioThUM06+W6eC+7EqyMTjtAvwr95pEOwIdSD288cFb/fH
 1jAA==
X-Gm-Message-State: AOAM5303cxl9XCAuIeeRtHU7N/QPNYYlMaxU6Xq7XYS/YHk9/CoSJ4BQ
 9l+K92Px0QndI3du30HLxqgRT/CAqvDX8P27
X-Google-Smtp-Source: ABdhPJz/54zEkjIQYHkVyG85MSX2HkA+/SFVjjwpqdKD8iKQK9LciRwiezNQ85oPNFafQl8UHOP2Rw==
X-Received: by 2002:a17:902:9a0c:b029:d6:c6a3:66f with SMTP id
 v12-20020a1709029a0cb02900d6c6a3066fmr1277406plp.52.1605616801832; 
 Tue, 17 Nov 2020 04:40:01 -0800 (PST)
Received: from ?IPv6:2402:3a80:425:6282:bc1b:1de0:7718:e8a1?
 ([2402:3a80:425:6282:bc1b:1de0:7718:e8a1])
 by smtp.gmail.com with ESMTPSA id 3sm21026426pfv.92.2020.11.17.04.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 04:40:01 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201117104259.32753-1-yashsri421@gmail.com>
 <CAKXUXMx+pdxdQj-xDXAPGqM=bKjzuDA1brOiV=m9Ti_HbyfgHg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <3141c2f9-cd90-9ecc-7e1b-f9a8da371f5e@gmail.com>
Date: Tue, 17 Nov 2020 18:09:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMx+pdxdQj-xDXAPGqM=bKjzuDA1brOiV=m9Ti_HbyfgHg@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	LOGICAL_CONTINUATIONS
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

On 17/11/20 4:23 pm, Lukas Bulwahn wrote:
> On Tue, Nov 17, 2020 at 11:43 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently, checkpatch warns if logical continuations are placed at the
>> start of a line and not at the end of previous line.
>>
>> E.g., running checkpatch on commit 3485507fc272 ("staging:
>> bcm2835-camera: Reduce length of enum names") reports:
>>
>> CHECK: Logical continuations should be on the previous line
>> +       if (!ret
>> +           && camera_port ==
>>
>> Provide a simple fix by adding logical operator at the end of previous
>> line and removing from current line, if both the lines are additions
>> (ie start with '+')
>>
> 
> That change makes sense. I wonder, though. if we are now just starting
> to reimplement clang-format (just worse...).
> 
> E.g., what happens when you run clang-format on that file; would it do
> the same correction to those lines?
> 
Yes, clang-format makes the same changes, ie appends '&&' on previous
line and removes from current line. However, in addition, it also
indents next line (after current line) by 12 spaces (ie one tab-space
and 4 white-spaces).
Should I proceed with this patch and send it out to Joe?

Thanks
Aditya

> Lukas
> 
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 5b1a5a65e69a..f61ac7456151 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -3553,8 +3553,14 @@ sub process {
>>
>>  # check for && or || at the start of a line
>>                 if ($rawline =~ /^\+\s*(&&|\|\|)/) {
>> -                       CHK("LOGICAL_CONTINUATIONS",
>> -                           "Logical continuations should be on the previous line\n" . $hereprev);
>> +                       my $operator = $1;
>> +                       if (CHK("LOGICAL_CONTINUATIONS",
>> +                               "Logical continuations should be on the previous line\n" . $hereprev) &&
>> +                           $fix && $prevrawline =~ /^\+/) {
>> +                               # add logical operator to the previous line, remove from current line
>> +                               $fixed[$fixlinenr - 1] .= " $operator";
>> +                               $fixed[$fixlinenr] =~ s/$operator\s*//;
>> +                       }
>>                 }
>>
>>  # check indentation starts on a tab stop
>> --
>> 2.17.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
