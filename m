Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E3AC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 10:23:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 939D820729
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 10:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkrekXXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 939D820729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6CE20884A2;
	Wed, 22 Jul 2020 10:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WW8waYp+zW9W; Wed, 22 Jul 2020 10:23:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 08FF0883B6;
	Wed, 22 Jul 2020 10:23:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01E3BC004E;
	Wed, 22 Jul 2020 10:23:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDB4EC004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 10:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ACC85862BE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 10:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcY0Rafu6PyG
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 10:23:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EEF9E8623B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 10:23:44 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id y10so1657154eje.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 03:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8Lv+luVDPtcVKAC8K2H6ktm/UZRo9ZSjg7XwTLDyjyo=;
 b=HkrekXXKH2vMhT61LrinoYQT2WebgecrYbLEFUVgfI25j/J89qPu4DEB2bzUhECKFY
 qB6DrggVwp4rpNBz/lBFlZIC5mJh2v6MsAgZVSlxS1LFkw89zLE/nIX9z2F6B9yir9b2
 1ikvZXB6Nc1M1loJFwtMiA+4BJONnAwp0GmM98hGpMkbXIF3TOqYN4mddlzMFhl9C8o6
 yA6E3PDNxY607CJXsIacbXC7pm+UeoV00wTc1j7acdfUrgr3AnqXgXydNzDK7YdRFnup
 kqycAhUN0NVTNPRohVkH2oFZ1CHRq4Uor8ndSbR7kQvv8QfHH5KExEStjS+ax+WjbYwY
 UDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8Lv+luVDPtcVKAC8K2H6ktm/UZRo9ZSjg7XwTLDyjyo=;
 b=ecMCDEVrSy4r/OExhR/0N7+BQShOs0ux59AjKq4kNfEl0d6Aea5V6NQi/6snjrVpPm
 ZO83MLhtG6twDJ4UMKjyinKlfnNjwVEJKQ0UE4KHYzQMVyPDT70/GqKrVDCIYdIT4+jG
 AGDiAXMZWi0j1vCDyHo89oSIi0uII9r44J/i+o2BCrk3aizJp5TcAqcg30gfqZof6RAd
 Fm7Q5xbDoMEXrTbEREZNaJtX1mF5Y03eamNMNyinNQB1OAlTsk5KcrBsWu9u8aiCvSRa
 nGCUzRHmN/+/WRFwFRml7mhuZGXTaOCQv8DQTzuzChDGRw1gwAxiM52LHGUA2tpZTqmG
 E5kg==
X-Gm-Message-State: AOAM533tTALOeOMa2o3yPj0FQ4YijLlSrxJsokmUetRGSkrEjX0GP93A
 R+hwyA/6uy2SetjTUuC7XX4=
X-Google-Smtp-Source: ABdhPJyVkP2Ssl/D5UHULWR0YTrzJLd576QhGQDYsP2rKx2/9xZuF7a4onVNgeu+Ns+pVYLiZu+NgA==
X-Received: by 2002:a17:906:d963:: with SMTP id
 rp3mr28546712ejb.54.1595413423425; 
 Wed, 22 Jul 2020 03:23:43 -0700 (PDT)
Received: from felia ([2001:16b8:2d99:5b00:39e7:5cec:d6f4:a49a])
 by smtp.gmail.com with ESMTPSA id f16sm18331251ejr.0.2020.07.22.03.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 03:23:42 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 22 Jul 2020 12:23:40 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200721054438.z7nhvykoqztofoui@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2007221221180.10005@felia>
References: <20200721054438.z7nhvykoqztofoui@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Warn about missing
	shebang in scripts
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



On Tue, 21 Jul 2020, Mrinal Pandey wrote:

> checkpatch should warn if a script doesn't seem to have a shebang in the
> first line. There is no such check present currently.
> 
> Issue this warning by checking if the file is a script and checking
> `$realline` to be `1`, i.e. the first line. If these conditions are
> satisfied and the first line is not a shebang, issue a missing or
> mispaced shebang warning.
> 
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
>  scripts/checkpatch.pl | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4c820607540b..c79233c64cee 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3165,6 +3165,13 @@ sub process {
>  			}
>  		}
>  
> +# check for missing shebang in scripts
> +                if ($realline == 1 && $realfile =~ /.*\.\(py\|sh\|pl\|awk\|tc\|yaml\)/) {

yaml files do not have a shebang...

This whole check can probably placed elsewhere better.

> +                        if ($rawline !~ /^[ \+]\s*\#\!\s*\//) {
> +                                WARN("MISSING_SHEBANG", "Missing or misplaced shebang for '$realfile'");
> +                        }
> +                }
> +
>  # check for using SPDX license tag at beginning of files
>  		if ($realline == $checklicenseline) {
>  			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
