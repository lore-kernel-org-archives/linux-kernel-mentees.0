Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CD7C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 10:09:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AF94610F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 10:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AF94610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A64080B6F;
	Fri, 20 Aug 2021 10:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94TJzEikuOM1; Fri, 20 Aug 2021 10:09:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3776780B02;
	Fri, 20 Aug 2021 10:09:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D375C001A;
	Fri, 20 Aug 2021 10:09:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79701C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C5C380B23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5VnolBiao61
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:09:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21E3280B02
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:09:27 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id n126so4541827ybf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=94k1PdMmYikLz9Q95XfHip9uvfu5U6bbVzQUGSsAIt4=;
 b=VDdBYGmDiMrqQaqn3sGTqUT+A7EuyCpou7ImG1bbo6syJmc7a4H6zOIGa0w+Y83jIM
 wa2CXfyOgVbhrMgwfBkrQz3j2TE/ie5G1L/D7zar0hFUJb6t06AJRS9eq72A1CoOnbEs
 8T23oqWRBPju4qHnvFS+f0XXWjxN2X48dwsj0AOSHOUOn0O//MM7qpHgqsv18xlcEgwO
 m8LO2gZG7y1RYASonR3c4h/D5/+68zH7DtB0dYXh/pG9LMQvyw3rUnxSS//SNPoZzvfQ
 ZAMLgO2vz0FsafySXaNqJ67uT944ZDHBdLgAoRw8zb1GZO+iI+gF3g6SlUaXs3IrsMs2
 QQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94k1PdMmYikLz9Q95XfHip9uvfu5U6bbVzQUGSsAIt4=;
 b=N40ssz8NlzqBjjZTAbVodBWY50uoWfaebZGVl7y6MEwc6rRHA/OXyOclT1zoyN+W95
 oua/b0N/eazUsODPi4w0lPtg8lr0EvxEXmMKHyE0l35/jaPxqvQ/Ov1HG9XyHshtTAFU
 7FqrVotQwYxXl9YCrmZn/GmMacHRvU31fXBh+riGM5rWMUVzTSGWpf3nClGhQnY3l2m9
 hi/iERJPG9g0IzO51fZo71ByPoj+N02szX4gVfnzfk0k3JrJwgUAXRhkpJE3JCjhaDxN
 Sxtwll4/ohnXorpgbhNswsu1ZoBaBxZFcQjtE6sKFWJbK3rWGuAd1hgYYGE//f4t1cgl
 hTmw==
X-Gm-Message-State: AOAM532hGwfSwQidk6hvp8I+kGprheUtFStFj9ff7v3ThGTKTXs158Qy
 CdG8w3WIoR7y5ai9Jk0xRb+EjFo/5MHEcWggkcQ=
X-Google-Smtp-Source: ABdhPJx9PwNE3baNg4TxTnS3x/QGIFdB+BlTGOm6k49lVelOHGajUbPRSuC2UL2Odo/d8qUc4Yduf1V1LEAGx8ScQaY=
X-Received: by 2002:a25:b08d:: with SMTP id f13mr24832206ybj.518.1629454166046; 
 Fri, 20 Aug 2021 03:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMxJ9CKP1nftTWmP-UTaMMyuOtoNYz4SQYrDPP9PdaRp4A@mail.gmail.com>
 <20210803183735.2525-1-utkarshverma294@gmail.com>
In-Reply-To: <20210803183735.2525-1-utkarshverma294@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 20 Aug 2021 12:09:22 +0200
Message-ID: <CAKXUXMy2eXLT9HOa2zgR08bXvNcVHH_BssLsOcUC==CGxU5OFw@mail.gmail.com>
Subject: Re: [PATCH v2] USB: serial: iuu_phoenix: Replace symbolic permissions
 by octal permissions
To: Utkarsh Verma <utkarshverma294@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Concerning the subject line (commit message header prefix), check with
git log --oneline drivers/usb/serial/iuu_phoenix.c for the common
style of the prefix here. The prefix "USB: serial: iuu_phoenix:" looks
reasonable; did you check that before or is this just a coincidence
that it matches?

The patch looks good so far. Utkarsh, will you send this now to the
appropriate recipients according to ./scripts/get_maintainer.pl?

Lukas

On Tue, Aug 3, 2021 at 8:38 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Fix checkpatch warnings:
> WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
> Consider using octal permissions '0644'.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> ---
>  drivers/usb/serial/iuu_phoenix.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
> index 19753611e..0be3b5e1e 100644
> --- a/drivers/usb/serial/iuu_phoenix.c
> +++ b/drivers/usb/serial/iuu_phoenix.c
> @@ -1188,20 +1188,20 @@ MODULE_AUTHOR("Alain Degreffe eczema@ecze.com");
>  MODULE_DESCRIPTION(DRIVER_DESC);
>  MODULE_LICENSE("GPL");
>
> -module_param(xmas, bool, S_IRUGO | S_IWUSR);
> +module_param(xmas, bool, 0644);
>  MODULE_PARM_DESC(xmas, "Xmas colors enabled or not");
>
> -module_param(boost, int, S_IRUGO | S_IWUSR);
> +module_param(boost, int, 0644);
>  MODULE_PARM_DESC(boost, "Card overclock boost (in percent 100-500)");
>
> -module_param(clockmode, int, S_IRUGO | S_IWUSR);
> +module_param(clockmode, int, 0644);
>  MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, "
>                 "3=6 Mhz)");
>
> -module_param(cdmode, int, S_IRUGO | S_IWUSR);
> +module_param(cdmode, int, 0644);
>  MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, "
>                  "4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
>
> -module_param(vcc_default, int, S_IRUGO | S_IWUSR);
> +module_param(vcc_default, int, 0644);
>  MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 "
>                 "for 5V). Default to 5.");
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
