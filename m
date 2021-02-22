Return-Path: <SRS0=c16L=HY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA7DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 17:27:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D0B364EEC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 17:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D0B364EEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 585988701E;
	Mon, 22 Feb 2021 17:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shFKmVRvT2pG; Mon, 22 Feb 2021 17:27:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D2F3286DEA;
	Mon, 22 Feb 2021 17:27:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C56A4C000A;
	Mon, 22 Feb 2021 17:27:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38B38C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 17:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2310586E5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 17:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSij-3KaZ8ba
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 17:27:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 944C486DEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 17:27:26 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id e9so8163696plh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 09:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=edcfb6u/1BZN0KQqup+/d7AkLC2yW/srYObkME7xBZw=;
 b=WQVEROLZ/gB3RzKmDk5qFHfwaGxNwkrLQN0J/bFqnSSFzhuAy7x3pFQ8jlpZ7ZD3ll
 TYTuE+x07gkfKrYoip61kR6eR3uu4Wxb25u2EgUU3KjsdJSo81W0gkD89mH3YV0QN6c5
 BDPzjqP8LWC1LAHsgBOtphwnuEYAeOG6voZZZid1mVyW5WO5pRWCu8Sk1cz4Qnli7JiC
 BDojUO+Y8W4HB0HJZ3uyfo+V6wm5dLemqjwcOUW810l/I1BuckNRdziovy4rAf4fSy70
 W3n+G06fQd+woOgHozPIl14hD98+AV/5hmbzfRtdPpzF/yiOzLff6qLXLYLrBFEQbqEK
 4+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=edcfb6u/1BZN0KQqup+/d7AkLC2yW/srYObkME7xBZw=;
 b=ouSZE/yk+Ie4qnKDba3YfGKZ7xgAIHyGqAr/m9o+j2KJQvnMxi55hgwsRnPc96LctD
 TGd9caJfYo/H2AhHiA1gLjRcYrbw+Cj+yxT8lyE16DgAC0a5z/ovZIcz/AgxVTFFNEil
 ePZ3HxKl1oPp3+uj8ChMWWDIiASdYOF1qAN4T5hElwwq0B67cj389/Di442IHUOGlkfA
 EmFRzug0hDokTjQLINtD8KGccNe/zr2J1P4XdYCDViFHGJmNycd209WOl3N4SICh5R9Z
 u9Ku5oeYt4I+tdbZ+dbT85YcMEOB6YDZhJzUux1bi3r7WDpfWqumUt5DU5OdDdAsqgAT
 IqCw==
X-Gm-Message-State: AOAM531GMhteiXZAL9YObQQBr8ZGuf4txhYKNg4HPlQAuTMB0RV9/+xs
 PBmxfjbH7MayIUBc7JCynPk=
X-Google-Smtp-Source: ABdhPJw1d2qboOMWAmrZuuWgFSfoPCLXsgUVeus6Kk6uLUbaq1hUf8xWFoLVJw58F2c0YmFPKhm8kw==
X-Received: by 2002:a17:902:b48b:b029:e3:7808:aab4 with SMTP id
 y11-20020a170902b48bb02900e37808aab4mr23021419plr.54.1614014845604; 
 Mon, 22 Feb 2021 09:27:25 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:d92b:2fcb:b6a3:bcc0?
 ([2405:201:600d:a089:d92b:2fcb:b6a3:bcc0])
 by smtp.gmail.com with ESMTPSA id n1sm18662545pgn.94.2021.02.22.09.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:27:25 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, corbet@lwn.net
From: Aditya <yashsri421@gmail.com>
Message-ID: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
Date: Mon, 22 Feb 2021 22:57:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] Investigating parsing error for struct/union
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

Hi Jonathan, Lukas

While investigating "error: Cannot parse struct or union!", I
discovered few more patterns causing this error:
1) A large part of this error(~80%) occurs due to the presence of one
or more lines(such as '#define' lines) between commented code and
struct declaration.

For e.g., in include/linux/platform_data/apds990x.h:

/**
 * struct apds990x_chip_factors - defines effect of the cover window
 * @ga: Total glass attenuation
 * @cf1: clear channel factor 1 for raw to lux conversion
 * @irf1: IR channel factor 1 for raw to lux conversion
 * @cf2: clear channel factor 2 for raw to lux conversion
 * @irf2: IR channel factor 2 for raw to lux conversion
 * @df: device factor for conversion formulas
 *
 * Structure for tuning ALS calculation to match with environment.
 * Values depend on the material above the sensor and the sensor
 * itself. If the GA is zero, driver will use uncovered sensor default
values
 * format: decimal value * APDS_PARAM_SCALE except df which is plain
integer.
 */
#define APDS_PARAM_SCALE 4096
struct apds990x_chip_factors {
	int ga;
	int cf1;
	int irf1;
	int cf2;
	int irf2;
	int df;
};


2) If struct does not contain any members, for e.g., in
include/linux/xz.h:

/**
 * struct xz_dec - Opaque type to hold the XZ decoder state
 */
struct xz_dec;

Here, it causes error as the curly braces and members expected by the
regex, are absent.
This kind of use has also been made in include/linux/zstd.h:

/**
 * struct ZSTD_DDict - a digested dictionary to be used for decompression
 */
typedef struct ZSTD_DDict_s ZSTD_DDict;


3) Different Syntax than expected. For e.g.:
    a) struct xyz struct_name {} syntax. This syntax has been used in
arch/arm/mach-omap2/omap_hwmod_common_data.c file
    b) "static __maybe_unused const struct st_sensors_platform_data
default_press_pdata = {" in drivers/iio/pressure/st_pressure.h.
This kind of syntax has also been used in
drivers/iio/accel/st_accel.h, and drivers/iio/gyro/st_gyro.h

I wanted to take your opinion if we should extend support for any of
these syntax, causing the error. If not, perhaps we can make the
documentation a bit clear, atleast for (1), which causes most of these
errors; so as to not include any lines between comment and struct
declaration.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
