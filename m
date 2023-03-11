Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809C4C6FD1D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Mar 2023 20:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F322D8232B;
	Fri, 17 Mar 2023 20:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F322D8232B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PoW//RtJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2OeDApDdHmE; Fri, 17 Mar 2023 20:56:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0C75A8232C;
	Fri, 17 Mar 2023 20:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C75A8232C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB21BC0035;
	Fri, 17 Mar 2023 20:56:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EE6AC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 03:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 408CC40187
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 03:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 408CC40187
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PoW//RtJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gY5l8W0kTpBa
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 03:40:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29BEC4016D
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29BEC4016D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 03:40:05 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-176e43eb199so8095559fac.7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Mar 2023 19:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678506004;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4ze71QqSIgsiRn9c3VjUq+U4hxPR1aSy3jn2VpUcHbU=;
 b=PoW//RtJwgpqpwoqVUvBxVp/Mi5E2RuVJeEOwAdCI3f1kJrQnRtmVQTsqoc97oYfbF
 h4Ar9KFB5gaCApXMlwK/tSJ0JIqkTd+uVVJXw4f647eZrV3XqTYh0fr1ute0nyTHxvKd
 Vtcxosfwblp3YGuHbbBj3B6wx+UM+zxud0wGnYiELneSsza4PtnHUwbiRrhIUxxl2NTS
 Gxv+pa46xCNdB8KKNnZXWsTCfxVCcddRLSmrTjg7PyMvUJGTWhpK4KZSfvrt5XGUcIoH
 kalpOY3KDPZTfEg80X35JisAm32nVcxxvk2PNPKPy852CkamVwU11l18+kU9g8cfi7dQ
 fs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678506004;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ze71QqSIgsiRn9c3VjUq+U4hxPR1aSy3jn2VpUcHbU=;
 b=vZqHZlhsS9vSLxeOAGMqLI49u5jKwpWR9CpCrf50s8bNor4kxSUGZkotXu5hgNj3IF
 UAyZxf8A3QwqIh6mNyzOwmgkN40OS1fnK/JXc2dJSGHAXndzjsNgnmM0rIQJ1W5/r4n2
 LafhuxS6/+64vyjlm9DarKSEvYoIjuoMHJus8CEweUb3Hg17+tSHxEY+XBY7Opg3wKdC
 ODM7iXRVSubATvD+Ud3wzNoHtrHrydThDa/kGkAGY22bi+AR8XAFOSjyciV1wZsXbKTF
 3YaBtbpbIlT5AgvuuOfKsGsGVUQS44WzC67J8+YPN/2InOdKulrNBeOU0RjfL4+upV+H
 bsyQ==
X-Gm-Message-State: AO0yUKWhJZE9/CS8JTU7yzcCv5svWRF6wdjA2XM9n37d3QKJrDnvkDGf
 YM6xtEv/CCO/TvdReXdtCD3zFalO5BjrFL8K6DKjqndQ+PA=
X-Google-Smtp-Source: AK7set9fzjuIL39S2Pw7aBkbVtlzhvXk/fh+slKsbSFMiXSQN9T5lhvb31fEc8WgW3A1nWVF/142tFNj9H6MgvENhI4=
X-Received: by 2002:a05:6870:7735:b0:16e:8dc0:3861 with SMTP id
 dw53-20020a056870773500b0016e8dc03861mr9288123oab.2.1678506003999; Fri, 10
 Mar 2023 19:40:03 -0800 (PST)
MIME-Version: 1.0
From: Aviral Gupta <shiv14112001@gmail.com>
Date: Sat, 11 Mar 2023 09:09:49 +0530
Message-ID: <CAN8in0Fd2u841ACtwwJ=OcOhTVdmW=XoyCiHYuFzuwVxcxuiMQ@mail.gmail.com>
Subject: Unsubscribe
To: Linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Approved-At: Fri, 17 Mar 2023 20:56:22 +0000
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
Content-Type: multipart/mixed; boundary="===============8230203175589207824=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8230203175589207824==
Content-Type: multipart/alternative; boundary="0000000000001f312a05f697a2c1"

--0000000000001f312a05f697a2c1
Content-Type: text/plain; charset="UTF-8"

I don't  wish to receive  any  further  communication

--0000000000001f312a05f697a2c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I don&#39;t=C2=A0 wish to receive=C2=A0 any=C2=A0 further=
=C2=A0 communication=C2=A0</div>

--0000000000001f312a05f697a2c1--

--===============8230203175589207824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8230203175589207824==--
