Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EACE95A67
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Oct 2023 19:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F303C41770;
	Sun,  8 Oct 2023 19:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F303C41770
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.a=rsa-sha256 header.s=mail header.b=h2gP711h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GwMLnSyYPC-G; Sun,  8 Oct 2023 19:11:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B9D904173E;
	Sun,  8 Oct 2023 19:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D904173E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C800C0071;
	Sun,  8 Oct 2023 19:11:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87A09C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 19:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CB5260F74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 19:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB5260F74
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de
 header.a=rsa-sha256 header.s=mail header.b=h2gP711h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnzraWy5VzoW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 19:10:59 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0EAA60EE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 19:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0EAA60EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1696792257; bh=HTTJDJafn8qJ5y8ypB1X2wmPBXY2xmjffTqJQzQtOmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h2gP711hueezP+66rwMJLWYR4gkQ+T+bNaaoU1UBRrB5ACZvmSlGFC64Y1V/FNuNy
 vg5SHL6shRKFt4Am7e6nAtNyg5GSrGzRuz3erfCVkufo+nUhSbZxsMrfUAE+EtDsL/
 DbXCjvYZXzhT80IzWgGBfSVtjFYDC/KDoBZvldhY=
Date: Sun, 8 Oct 2023 21:10:56 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Anshul Dalal <anshulusr@gmail.com>
Subject: Re: [PATCH v2 2/2] input: joystick: driver for Adafruit Seesaw Gamepad
Message-ID: <54334f96-a1cc-439b-9de2-ec0187495f35@t-8ch.de>
References: <20231008172435.2391009-1-anshulusr@gmail.com>
 <20231008172435.2391009-2-anshulusr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231008172435.2391009-2-anshulusr@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 2023-10-08 22:54:34+0530, Anshul Dalal wrote:
> [..]
> +
> +	input_report_abs(input, ABS_X, data.x);
> +	input_report_abs(input, ABS_Y, data.y);
> +	input_report_key(input, BTN_A, data.button_a);
> +	input_report_key(input, BTN_B, data.button_b);
> +	input_report_key(input, BTN_X, data.button_x);
> +	input_report_key(input, BTN_Y, data.button_y);

FYI the button layout on this device is different from common commercial
gamepads like XBox, Playstation and Logitech.
This seems to be common to all gamepads from Adafruit.

Adafruit:

    X
 Y     A
    B

Others:

    Y
 X     B
    A


In input-event-codes.h the symbol BTN_A actually maps to BTN_SOUTH,
matching the common layout. But as you can see this is wrong for this
device.
(Same for BTN_B and BTN_EAST)

Weirdly enough for BTN_X/BTN_NORTH and BTN_Y/BNT_WEST the aliasing is
correct for Adafruit and wrong for the others.

Not sure how to fix this correctly. Maybe the input maintainers know.

> +	input_report_key(input, BTN_START, data.button_start);
> +	input_report_key(input, BTN_SELECT, data.button_select);
> +	input_sync(input);
> +}
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
