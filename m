Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A29C7EE45
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Jun 2023 05:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0EAE40509;
	Thu,  8 Jun 2023 05:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0EAE40509
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JiLj0k/k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_3kBcKhE7sl; Thu,  8 Jun 2023 05:14:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 441A44050F;
	Thu,  8 Jun 2023 05:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 441A44050F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 131AEC0037;
	Thu,  8 Jun 2023 05:14:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0698CC0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jun 2023 05:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB3834050F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jun 2023 05:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB3834050F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0AwJvT5Q_0h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jun 2023 05:14:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDE0040509
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDE0040509
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jun 2023 05:14:16 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b04706c85fso1006085ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Jun 2023 22:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686201256; x=1688793256;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bpAU5WkVE/wtFEVm7r+ibR0BKuprOl5u/o3sLZZPjdU=;
 b=JiLj0k/kt8UytBRW9NDnQPfNyI1FzzcS1zD8eSiGWFHmHsXEHkZHMgIdVQmx2TbbYL
 Sg/6aXsoIlV3Rafg81/vh2k7MFwQ0cTAjC49qdSKNbDM5yOR2aRa1LBUkTJrKEh1t1hc
 Yuctujxh65UjI0r6pe2rnKfs10v6vlLxvM8nCPRMzD9/x++VltFTLKRt1TOqYRMc6hEu
 YDRAhryE8swk60466ySyVM1e++NDP175JGoJrlACgLDs+anSrXsL5tnL4ZtpvJi9x5hY
 Dc4abXqrLa9K6aftYEiY6E0ab1voy45A1NdC9oPYkMmH7l2u+63pbUqZ6PV9B6iNtfH9
 QTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686201256; x=1688793256;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpAU5WkVE/wtFEVm7r+ibR0BKuprOl5u/o3sLZZPjdU=;
 b=X+mPSkgiTHgMHKh+wpMgYKYH8UIybwa4ujps+cZLiRpicNphpTUbccIX87zrFbWuh8
 kLEyyd/B2xV3WEFggp1EvHOdR60qe900Q1OvBPUH9k01GHNF5wMfhIlDi865W6ZyOgBr
 VCuRR4uf9xulNztEaotpotK3Tidwong/QfI1e03Xvql1RLGxSD+WqbQwBssLDVcVKbxE
 DSXruGZZFKKZvUi/eRGL35uegPzglmeHmosoUvoVICbsHRApQwumbqbnMmQu3D/w8NT6
 9PW0V6sbtPdx41R1RodZycoM5PUJ98L1tcNxeWGw1mOsixJY9g2bD1Dj088WsbcVRpVE
 1Lbg==
X-Gm-Message-State: AC+VfDxmg3nKVQMjgL19JphvskjxPYNpv3UmbtHuN/ZSykxIcQo19zQr
 +4k2PPVKxBcwnJYmv2vkpF8=
X-Google-Smtp-Source: ACHHUZ7PsZUhyvqZvDzdteGKDPRW07qivbilkfyHjFiAtWZ7dNWv1WVJ4+MYga1/UpWAi96+fh/w/g==
X-Received: by 2002:a17:903:4295:b0:1ae:5914:cbec with SMTP id
 ju21-20020a170903429500b001ae5914cbecmr7531015plb.10.1686201255924; 
 Wed, 07 Jun 2023 22:14:15 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-10.three.co.id. [180.214.233.10])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a17090332cc00b001b04949e0acsm396483plr.232.2023.06.07.22.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 22:14:15 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 16A921069EA; Thu,  8 Jun 2023 12:14:10 +0700 (WIB)
Date: Thu, 8 Jun 2023 12:14:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>, perex@perex.cz, tiwai@suse.com,
 corbet@lwn.net, broonie@kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v3 1/3] docs: sound: add 'pcmtest' driver documentation
Message-ID: <ZIFjog1a93_FFBPF@debian.me>
References: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============0343076157039603880=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============0343076157039603880==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lJm1/npRizm0mCUv"
Content-Disposition: inline


--lJm1/npRizm0mCUv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 05:38:05PM +0400, Ivan Orlov wrote:
> diff --git a/Documentation/sound/cards/pcmtest.rst b/Documentation/sound/=
cards/pcmtest.rst
> new file mode 100644
> index 000000000000..e163522f3205
> --- /dev/null
> +++ b/Documentation/sound/cards/pcmtest.rst
> @@ -0,0 +1,120 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +The Virtual PCM Test Driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +The Virtual PCM Test Driver emulates a generic PCM device, and can be us=
ed for
> +testing/fuzzing of the userspace ALSA applications, as well as for testi=
ng/fuzzing of
> +the PCM middle layer. Additionally, it can be used for simulating hard t=
o reproduce
> +problems with PCM devices.
> +
> +What can this driver do?
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +At this moment the driver can do the following things:
> +	* Simulate both capture and playback processes
> +	* Generate random or pattern-based capturing data
> +	* Inject delays into the playback and capturing processes
> +	* Inject errors during the PCM callbacks
> +
> +It supports up to 8 substreams and 4 channels. Also it supports both int=
erleaved and
> +non-interleaved access modes.
> +
> +Also, this driver can check the playback stream for containing the prede=
fined pattern,
> +which is used in the corresponding selftest (alsa/pcmtest-test.sh) to ch=
eck the PCM middle
> +layer data transferring functionality. Additionally, this driver redefin=
es the default
> +RESET ioctl, and the selftest covers this PCM API functionality as well.
> +
> +Configuration
> +-------------
> +
> +The driver has several parameters besides the common ALSA module paramet=
ers:
> +
> +	* fill_mode (bool) - Buffer fill mode (see below)
> +	* inject_delay (int)
> +	* inject_hwpars_err (bool)
> +	* inject_prepare_err (bool)
> +	* inject_trigger_err (bool)
> +
> +
> +Capture Data Generation
> +-----------------------
> +
> +The driver has two modes of data generation: the first (0 in the fill_mo=
de parameter)
> +means random data generation, the second (1 in the fill_mode) - pattern-=
based
> +data generation. Let's look at the second mode.
> +
> +First of all, you may want to specify the pattern for data generation. Y=
ou can do it
> +by writing the pattern to the debugfs file. There are pattern buffer deb=
ugfs entries
> +for each channel, as well as entries which contain the pattern buffer le=
ngth.
> +
> +	* /sys/kernel/debug/pcmtest/fill_pattern[0-3]
> +	* /sys/kernel/debug/pcmtest/fill_pattern[0-3]_len
> +
> +To set the pattern for the channel 0 you can execute the following comma=
nd:
> +
> +.. code-block:: bash
> +
> +	echo -n mycoolpattern > /sys/kernel/debug/pcmtest/fill_pattern0
> +
> +Then, after every capture action performed on the 'pcmtest' device the b=
uffer for the
> +channel 0 will contain 'mycoolpatternmycoolpatternmycoolpatternmy...'.
> +
> +The pattern itself can be up to 4096 bytes long.
> +
> +Delay injection
> +---------------
> +
> +The driver has 'inject_delay' parameter, which has very self-descriptive=
 name and
> +can be used for time delay/speedup simulations. The parameter has intege=
r type, and
> +it means the delay added between module's internal timer ticks.
> +
> +If the 'inject_delay' value is positive, the buffer will be filled slowe=
r, if it is
> +negative - faster. You can try it yourself by starting a recording in any
> +audiorecording application (like Audacity) and selecting the 'pcmtest' d=
evice as a
> +source.
> +
> +This parameter can be also used for generating a huge amount of sound da=
ta in a very
> +short period of time (with the negative 'inject_delay' value).
> +
> +Errors injection
> +----------------
> +
> +This module can be used for injecting errors into the PCM communication =
process. This
> +action can help you to figure out how the userspace ALSA program behaves=
 under unusual
> +circumstances.
> +
> +For example, you can make all 'hw_params' PCM callback calls return EBUS=
Y error by
> +writing '1' to the 'inject_hwpars_err' module parameter:
> +
> +.. code-block:: bash
> +
> +	echo 1 > /sys/module/snd_pcmtest/parameters/inject_hwpars_err
> +
> +Errors can be injected into the following PCM callbacks:
> +
> +	* hw_params (EBUSY)
> +	* prepare (EINVAL)
> +	* trigger (EINVAL)
> +
> +Playback test
> +-------------
> +
> +This driver can be also used for the playback functionality testing - ev=
ery time you
> +write the playback data to the 'pcmtest' PCM device and close it, the dr=
iver checks the
> +buffer for containing the looped pattern (which is specified in the fill=
_pattern
> +debugfs file for each channel). If the playback buffer content represent=
s the looped
> +pattern, 'pc_test' debugfs entry is set into '1'. Otherwise, the driver =
sets it to '0'.
> +
> +ioctl redefinition test
> +-----------------------
> +
> +The driver redefines the 'reset' ioctl, which is default for all PCM dev=
ices. To test
> +this functionality, we can trigger the reset ioctl and check the 'ioctl_=
test' debugfs
> +entry:
> +
> +.. code-block:: bash
> +
> +	cat /sys/kernel/debug/pcmtest/ioctl_test
> +
> +If the ioctl is triggered successfully, this file will contain '1', and =
'0' otherwise.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--lJm1/npRizm0mCUv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZIFjmgAKCRD2uYlJVVFO
o/VoAQDOriEk9HJC+190k8ieuW500QCJ/NEFQxzXMk7or87YlAEA5QHYfRdTu/of
gQzNqexUMffrXbfMLkuxIG7SEeWA/QE=
=riD2
-----END PGP SIGNATURE-----

--lJm1/npRizm0mCUv--

--===============0343076157039603880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0343076157039603880==--
