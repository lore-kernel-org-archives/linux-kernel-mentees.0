Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF972C04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 07:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2000B83F3A;
	Fri,  4 Aug 2023 07:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2000B83F3A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EdBv1zzb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgQUat0aS7W2; Fri,  4 Aug 2023 07:10:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1026D83F51;
	Fri,  4 Aug 2023 07:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1026D83F51
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E42BEC0072;
	Fri,  4 Aug 2023 07:10:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1CFAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 07:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD6F84094F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 07:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD6F84094F
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=EdBv1zzb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNdOWIlWb0YK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 07:10:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77D4F4045C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 07:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77D4F4045C
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24FDD61F4E;
 Fri,  4 Aug 2023 07:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612EAC433C8;
 Fri,  4 Aug 2023 07:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691133040;
 bh=62KxXbPq/v9mVt89IWvhNC7HqQ/Vf5hkkkSHvyM2294=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=EdBv1zzbSPBpUuAo7GeIIIR34w57JYjlIsm68aTkXnfGHjDXD+q6zFo/VqsURUKXM
 s+KRf43zRQR+D0PEZab22S3QFVNOeUr89tDHeOGcogDk7L1rhCCgsOBPQcIRWkASyO
 i0WHWZ3V2PNGKz8yOWyB4BWEJQuHvQF/trJ7JmKspmbSc3vxgRCnBppHSXNYZ5Ek8U
 UyRkA0bHSDDPr7lqz3ZMiqInK96cburfsTIyJcrETbV5VtCNzSO3hSLyf8+E9lMQIF
 ta9PAX7CUYYhZRPH0ioriboTKBfIDaMOGlWcDaDH82gfsEZL39n8Jeiu33BttOY81g
 P8zbObTzQDcew==
From: Kalle Valo <kvalo@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] ath6kl: replace one-element array with
 flexible-array member
References: <20230804045554.6934-1-rauji.raut@gmail.com>
 <2023080433-patio-staining-2cfe@gregkh>
Date: Fri, 04 Aug 2023 10:10:37 +0300
In-Reply-To: <2023080433-patio-staining-2cfe@gregkh> (Greg KH's message of
 "Fri, 4 Aug 2023 07:15:43 +0200")
Message-ID: <87sf8zs2oi.fsf@kernel.org>
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

Greg KH <gregkh@linuxfoundation.org> writes:

> On Thu, Aug 03, 2023 at 09:55:54PM -0700, Atul Raut wrote:
>
>> One-element arrays are no longer relevant, and their
>> place has been taken by flexible array members thus,
>> use a flexible-array member to replace the one-element
>> array in struct ath6kl_usb_ctrl_diag_cmd_write
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
>> index 5220809841a6..c8ecc9e85897 100644
>> --- a/drivers/net/wireless/ath/ath6kl/usb.c
>> +++ b/drivers/net/wireless/ath/ath6kl/usb.c
>> @@ -106,7 +106,7 @@ struct ath6kl_usb_ctrl_diag_cmd_write {
>>  	__le32 cmd;
>>  	__le32 address;
>>  	__le32 value;
>> -	__le32 _pad[1];
>> +	__le32 _pad[];
>
> Are you sure this is actually a variable length array?

It's not, it's just padding. We both told this in v1:

https://patchwork.kernel.org/project/linux-wireless/patch/20230731012941.21875-1-rauji.raut@gmail.com/

> And you just changed the size of this structure, are you sure this is
> correct?

This patch is not correct.

Atul, ALWAYS include a changelog when submitting a new version. Please
carefully read our wiki link below before submitting new patches to
wireless.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
