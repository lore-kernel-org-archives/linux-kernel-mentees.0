Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA71EB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Jul 2023 21:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3300240B96;
	Mon, 10 Jul 2023 21:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3300240B96
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rHgtS9tM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G78srju0eOYc; Mon, 10 Jul 2023 21:10:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 073AE404A5;
	Mon, 10 Jul 2023 21:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 073AE404A5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4EBDC0071;
	Mon, 10 Jul 2023 21:10:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A092CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69384820B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 21:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69384820B7
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=rHgtS9tM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUSPTmWeOX7b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 21:10:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2517482049
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2517482049
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 21:10:08 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b8b2b60731so22111415ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 14:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689023407; x=1691615407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RxBgucAbBdu0IzJonXBaaKE77FkZJQjZWz7yflbR3Ws=;
 b=rHgtS9tMj+PbfaQLlrrBQbvkMdvBFt5ZvHKTP+rf8glkYTJzb1ZdarorF6EPAHbVav
 qJ5XYOFijpSg4tyJtyd2aVpHOgqpwp4VsbxLGWRRVvqZa9SV1lbVd/YtqQ4Oz0GMfkvp
 9O+YnNsc9l1AT5CwORqAFoa6+HlXIj/Z+Bt3qdb5bsS31jzoy6cCxpiUsBhuaPoaVTGg
 0u8pY04x0/OOEtP1YqRtPNOBrhyhh8GJ/8fi1LucB2i1M3LYL3hw7MsF2cMM9x2fampG
 JEFBVPT8J/o2VtrZMIF5WK7UWhR9Y/tr3DvvfeRcC1CTkxgVjr83LA7ZH3FwUJGMcVvL
 SpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689023407; x=1691615407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxBgucAbBdu0IzJonXBaaKE77FkZJQjZWz7yflbR3Ws=;
 b=Yddy4Mso6WbgqCyxdm2Gy0APc6+4GMuKWKgei9D7hLOU7Y9j/VfK4YSiboB/WfVclC
 tt11zI97uKDFPZgs96WPjn0VB2HbwsIdZI4hd8bQgV3RAHttB22FkKs0v7pnhx0EYorg
 zT9VXOdhTLjaX+Nkb+hHQlmE55879BIu4AaNoob4yMoKLdh+cIMyS75M5FoM5wNzFrqY
 11Z6d8U/ieDfkUIAwWb0NaLX6eW+xXl/kxSHXcqymWYn+0A8ruItBAgFSuFxEVETOvUj
 kErDukRRJnWmETW24Ctwlvim10vGtdsAQ1BiRdwAeMnX/C1Y1sF7GJrC+ne07iJAwWn3
 p6Ig==
X-Gm-Message-State: ABy/qLbX1gid2kRaiZ7Gochx8ngg0Ji0F8afOPqEiJQWZSkIaaVCtsgU
 dXg3o83Q6p7JWbyA3OFyPFHSCg==
X-Google-Smtp-Source: APBJJlFN4CnA+xw8gns+5xtyY+OarOimOqCe+0/1XFT/cP1AmHbHUV+69BPWQLLeu4oeslpGzj/6mQ==
X-Received: by 2002:a17:903:124a:b0:1a9:40d5:b0ae with SMTP id
 u10-20020a170903124a00b001a940d5b0aemr12439810plh.12.1689023407417; 
 Mon, 10 Jul 2023 14:10:07 -0700 (PDT)
Received: from fedora (61-114-134-192.ppp.bbiq.jp. [61.114.134.192])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a1709028e8500b001b6740207d2sm317657plb.215.2023.07.10.14.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 14:10:06 -0700 (PDT)
Date: Sun, 9 Jul 2023 21:07:33 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: Re: [PATCH] tools/counter: Add checking directory exists for make
 clean
Message-ID: <ZKtZ1WB9LdszbxU+@fedora>
References: <362e127d-6018-5fc6-247b-3c729b99d946@gmail.com>
MIME-Version: 1.0
In-Reply-To: <362e127d-6018-5fc6-247b-3c729b99d946@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, rongtao@cestc.cn,
 ricardo@pardini.net
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
Content-Type: multipart/mixed; boundary="===============5961125915062804417=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============5961125915062804417==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RmzhX0RDy1psNxnS"
Content-Disposition: inline


--RmzhX0RDy1psNxnS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 09:08:35PM +0700, Anh Tuan Phan wrote:
> rmdir requires the directory exist so it causes "make -C tools clean"
> failed if someone only builds other tools but not counter. This commit
> adds checking the directory exist before doing rmdir.
>=20
> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> ---
>  tools/counter/Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/counter/Makefile b/tools/counter/Makefile
> index a0f4cab71fe5..2907f3b3094b 100644
> --- a/tools/counter/Makefile
> +++ b/tools/counter/Makefile
> @@ -40,7 +40,9 @@ $(OUTPUT)counter_example: $(COUNTER_EXAMPLE)
>  clean:
>  	rm -f $(ALL_PROGRAMS)
>  	rm -rf $(OUTPUT)include/linux/counter.h
> -	rmdir -p $(OUTPUT)include/linux
> +	@if [ -d $(OUTPUT)include/linux ]; then \
> +		rmdir -p $(OUTPUT)include/linux; \
> +	fi
>  	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
>=20
>  install: $(ALL_PROGRAMS)
> --=20
> 2.34.1

Hi Anh,

Please CC <linux-iio@vger.kernel.org> and <linux-kernel@vger.kernel.org>
as well in the future so Counter users and developers can become aware
of relevant patches.

One worry I have with this approach is the possible race condition where
the check for existence succeeds but the directory is deleted by another
agent before our rmdir executes. However, I'm not sure how we could
achieve such behavior atomically to prevent the issue.

One alternative I've considered is perhaps a single find command to
search for and delete empty directories:

    find $(or $(OUTPUT),.) -type d -empty -delete

But this will delete directories not created by the makefile which I
consider an unexpected behavior for the user (or at least very rude of
the script to do).

Perhaps we should delete the directory tree explicitly:

    rm -df $(OUTPUT)include/linux
    rm -df $(OUTPUT)include

Although we lose the symmetry of rmdir to our previous mkdir, this
should prevent the race condition issue and succeed whether the
directories still exist or not.

William Breathitt Gray

--RmzhX0RDy1psNxnS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZKtZ1QAKCRC1SFbKvhIj
K4hDAP9w2c3wZQu+EpvAt5WwqtMUX274NPd/BV+5v07V9USGIgEAwJY9F1i1y9Qr
pnnk74zbTZhPXXWYTjkMS/oICurGbAw=
=E0Ch
-----END PGP SIGNATURE-----

--RmzhX0RDy1psNxnS--

--===============5961125915062804417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5961125915062804417==--
