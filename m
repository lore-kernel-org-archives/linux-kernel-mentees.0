Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D6BC001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Aug 2023 14:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 403CA60EB3;
	Tue,  1 Aug 2023 14:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 403CA60EB3
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IcqNTVC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KW1X3ijtmW14; Tue,  1 Aug 2023 14:42:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3E9A260E4C;
	Tue,  1 Aug 2023 14:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E9A260E4C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24358C0071;
	Tue,  1 Aug 2023 14:42:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31E8AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 14:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 135B98129E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 14:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 135B98129E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=IcqNTVC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MrFEhUbpw7s6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 14:42:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CAA080FB8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 14:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CAA080FB8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4B84615C1;
 Tue,  1 Aug 2023 14:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2D3C433C9;
 Tue,  1 Aug 2023 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690900936;
 bh=Ifsf+UP7DfBl5X+t2F3PvEQ8d2CvFMBSWmOAi1tejUI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=IcqNTVC6OSw7u6y45OyD6q0oSZbVww1OfHa16ef3QjXxi4t3sbgXv9Gy36BJo3Kvt
 +SH5//cL604sQpPGKG+sAA7Oimky30stV9x9dt97vs1RAn3UgLnYv8694AczWkSejZ
 OCmM+oQ2xo4U+Vc3Bq8N4mvAcT8Nx3t7iaPt3B/ExnCzJFa/wiLv/Cc7aSIOf4Nohr
 mC7gyAlJMvoDYAGur+YFJKiwZInZEaTOsGMRJcVwwIzs48byCeUiNwRRUBKWAG9t3H
 955/FdBg9Haq/zVYNCeTTTsL+1dBWyIu1OxzwLQPhkJdU/kB3llakGCOkGdzCwmA/J
 59OMW5p46zgrw==
From: Kalle Valo <kvalo@kernel.org>
To: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] ath6kl: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
References: <20230731012941.21875-1-rauji.raut@gmail.com>
 <2023073103-basket-ranking-b6e6@gregkh>
Date: Tue, 01 Aug 2023 17:42:13 +0300
In-Reply-To: <2023073103-basket-ranking-b6e6@gregkh> (Greg KH's message of
 "Mon, 31 Jul 2023 08:05:52 +0200")
Message-ID: <877cqeygca.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Cc: Atul Raut <rauji.raut@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Greg KH <greg@kroah.com> writes:

> On Sun, Jul 30, 2023 at 06:29:41PM -0700, Atul Raut wrote:
>
>> Because zero-length arrays are obsolete, replacing them with
>> C99 flexible-array members.
>> Instead of defining a zero-length array, use the new
>> DECLARE_FLEX_ARRAY() auxiliary macro.
>> 
>> This fixes warnings such as:
>> ./drivers/net/wireless/ath/ath6kl/usb.c:109:8-12: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>> 
>> Signed-off-by: Atul Raut <rauji.raut@gmail.com>
>> ---
>>  drivers/net/wireless/ath/ath6kl/usb.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath6kl/usb.c b/drivers/net/wireless/ath/ath6kl/usb.c
>> index 5220809841a6..bb3771a3897c 100644
>> --- a/drivers/net/wireless/ath/ath6kl/usb.c
>> +++ b/drivers/net/wireless/ath/ath6kl/usb.c
>> @@ -106,7 +106,7 @@ struct ath6kl_usb_ctrl_diag_cmd_write {
>>  	__le32 cmd;
>>  	__le32 address;
>>  	__le32 value;
>> -	__le32 _pad[1];
>> +	DECLARE_FLEX_ARRAY(__le32, _pad);
>
> This is not a 0 length array, or a variable array.  Look at the work
> done on the hardening mailing list for more details, I think this is
> wrong.

I agree with Greg, this is just padding and _pad is not even used
anywhere in ath6kl. Though use of [1] is strange here, '__le32 _pad;'
would be enough.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
