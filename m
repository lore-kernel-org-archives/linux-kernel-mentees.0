Return-Path: <SRS0=c16L=HY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A94C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 21:37:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1556660234
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 21:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1556660234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C2A5185546;
	Mon, 22 Feb 2021 21:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLFtWtpLYiXU; Mon, 22 Feb 2021 21:37:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 444AD8543E;
	Mon, 22 Feb 2021 21:37:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29946C000A;
	Mon, 22 Feb 2021 21:37:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8150C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B6AB186FED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsgPjFqfqI-n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:37:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E494986FB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=3tXKMv1qPRXz2dzcmFGVzG1cw6XD0lrxGszcpPkSkyY=; b=SEGNuEYrfpgzuhA6XEFDFfDbvW
 96zdkUekPu0VHJSvWFSkUUOIwo2p71fUwiPvV6gLc9ElMz7wJFFCKIvx2iCuUEDO02AH7MusLKllE
 bMSfEwk55DGcwXxRI6CCcjDYQivgptyewCCPWB4nRy2aSmwdmGsHScm9VxArlLDzqsNCpF+uTksAh
 LWqtYaXldK7cBeLkHr9jZCLFr0OfipICKG3yUbJqkzJQOSv0y0F3My7tlfH3/vyEQFWgoxXMqth8q
 mM3Smd5keBfAvRNgna9skx1Voe3kYrM2F48oNoy2N2eT1DWJaCaXhcQgk+ig7IrYdTl/3byBtRqni
 OYupkQLw==;
Received: from [2601:1c0:6280:3f0::d05b]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEItM-0003lz-It; Mon, 22 Feb 2021 21:37:20 +0000
To: Aditya <yashsri421@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 corbet@lwn.net
References: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <93cbf6e1-093a-7399-43c9-422fd8423544@infradead.org>
Date: Mon, 22 Feb 2021 13:37:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Investigating parsing error for
	struct/union
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

On 2/22/21 9:27 AM, Aditya wrote:
> Hi Jonathan, Lukas
> 
> While investigating "error: Cannot parse struct or union!", I
> discovered few more patterns causing this error:
> 1) A large part of this error(~80%) occurs due to the presence of one
> or more lines(such as '#define' lines) between commented code and
> struct declaration.
> 
> For e.g., in include/linux/platform_data/apds990x.h:
> 
> /**
>  * struct apds990x_chip_factors - defines effect of the cover window
>  * @ga: Total glass attenuation
>  * @cf1: clear channel factor 1 for raw to lux conversion
>  * @irf1: IR channel factor 1 for raw to lux conversion
>  * @cf2: clear channel factor 2 for raw to lux conversion
>  * @irf2: IR channel factor 2 for raw to lux conversion
>  * @df: device factor for conversion formulas
>  *
>  * Structure for tuning ALS calculation to match with environment.
>  * Values depend on the material above the sensor and the sensor
>  * itself. If the GA is zero, driver will use uncovered sensor default
> values
>  * format: decimal value * APDS_PARAM_SCALE except df which is plain
> integer.
>  */
> #define APDS_PARAM_SCALE 4096
> struct apds990x_chip_factors {
> 	int ga;
> 	int cf1;
> 	int irf1;
> 	int cf2;
> 	int irf2;
> 	int df;
> };

I have been known to move a few of macros such as this one.
OTOH, if you can coax kernel-doc to skip macros and find a
struct/union/function, that would be OK IMO.

> 
> 
> 2) If struct does not contain any members, for e.g., in
> include/linux/xz.h:
> 
> /**
>  * struct xz_dec - Opaque type to hold the XZ decoder state
>  */
> struct xz_dec;
> 
> Here, it causes error as the curly braces and members expected by the
> regex, are absent.

I.e., there is no kernel-doc description there at all.

Then in lib/xz/xz_dec_stream.c, the struct is defined with no
kernel-doc at all.

IMO the struct in lib/xz/xz_dec_stream.c should be marked as
kernel-doc and then all of the fields in it marked as
  /* private: */
since the author(s) seem to want this struct to be private/opaque.

> This kind of use has also been made in include/linux/zstd.h:
> 
> /**
>  * struct ZSTD_DDict - a digested dictionary to be used for decompression
>  */
> typedef struct ZSTD_DDict_s ZSTD_DDict;
> 
> 
> 3) Different Syntax than expected. For e.g.:
>     a) struct xyz struct_name {} syntax. This syntax has been used in
> arch/arm/mach-omap2/omap_hwmod_common_data.c file
>     b) "static __maybe_unused const struct st_sensors_platform_data
> default_press_pdata = {" in drivers/iio/pressure/st_pressure.h.
> This kind of syntax has also been used in
> drivers/iio/accel/st_accel.h, and drivers/iio/gyro/st_gyro.h

kernel-doc should just ignore/skip/drop __maybe_unused.

> 
> I wanted to take your opinion if we should extend support for any of
> these syntax, causing the error. If not, perhaps we can make the
> documentation a bit clear, atleast for (1), which causes most of these
> errors; so as to not include any lines between comment and struct
> declaration.
> 
> What do you think?


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
