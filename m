Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CE2C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 10:47:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4ED121D91
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 10:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4ED121D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 40E49204D8;
	Fri, 25 Sep 2020 10:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZ7IFat0cUyK; Fri, 25 Sep 2020 10:47:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1AE0F203BF;
	Fri, 25 Sep 2020 10:47:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D734C0889;
	Fri, 25 Sep 2020 10:47:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67608C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 10:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5B6C086D95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 10:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pVrdA0XGfcr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 10:47:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 918F186D7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 10:47:47 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 88E5F1C0C46; Fri, 25 Sep 2020 12:47:40 +0200 (CEST)
Date: Fri, 25 Sep 2020 12:47:39 +0200
From: Pavel Machek <pavel@denx.de>
To: linux-kernel-mentees@lists.linuxfoundation.org,
 kernel list <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
Message-ID: <20200925104739.GA26609@amd>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [Linux-kernel-mentees] Help wanted in LED subsystem
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
Content-Type: multipart/mixed; boundary="===============3911810675720999447=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============3911810675720999447==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

In linux-next, I published TODO list for LED subsystem. Is that
something linux-kernel-mentees could help with?

Best regards,
							Pavel


+++ b/drivers/leds/TODO
@@ -0,0 +1,58 @@
+-*- org -*-
+
+* On/off LEDs should have max_brightness of 1
+* Get rid of enum led_brightness
+
+It is really an integer, as maximum is configurable. Get rid of it, or
+make it into typedef or something.
+
+* Review atomicity requirements in LED subsystem
+
+Calls that may and that may not block are mixed in same structure, and
+semantics is sometimes non-intuitive. (For example blink callback may
+not sleep.) Review the requirements for any bugs and document them
+clearly.
+
+* LED names are still a mess
+
+No two LEDs have same name, so the names are probably unusable for the
+userland. Nudge authors into creating common LED names for common
+functionality.
+
+? Perhaps check for known LED names during boot, and warn if there are
+LEDs not on the list?
+
+* Split drivers into subdirectories
+
+The number of drivers is getting big, and driver for on/off LED on a
+i/o port is really quite different from camera flash LED, which is
+really different from driver for RGB color LED that can run its own
+microcode. Split the drivers somehow.
+
+* Figure out what to do with RGB leds
+
+Multicolor is a bit too abstract. Yes, we can have
+Green-Magenta-Ultraviolet LED, but so far all the LEDs we support are
+RGB, and not even RGB-White or RGB-Yellow variants emerged.
+
+Multicolor is not a good fit for RGB LED. It does not really know
+about LED color.  In particular, there's no way to make LED "white".
+
+Userspace is interested in knowing "this LED can produce arbitrary
+color", which not all multicolor LEDs can.
+
+	Proposal: let's add "rgb" to led_colors in drivers/leds/led-core.c,
+	add corresponding device tree defines, and use that, instead of
+	multicolor for RGB LEDs.
+
+	We really need to do that now; "white" stuff can wait.
+
+RGB LEDs are quite common, and it would be good to be able to turn LED
+white and to turn it into any arbitrary color. It is essential that
+userspace is able to set arbitrary colors, and it might be good to
+have that ability from kernel, too... to allow full-color triggers.
+
+* Command line utility to manipulate the LEDs?
+
+/sys interface is not really suitable to use by hand, should we have
+an utility to perform LED control?

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9tyssACgkQMOfwapXb+vJwYwCdG0auv9aF9khVFQIS3OPAAcqk
mMkAniskimJAzmhYhVGKqTW4+k7j3T3f
=IOvW
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--

--===============3911810675720999447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3911810675720999447==--
