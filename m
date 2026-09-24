Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533BA4BEE49
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 19:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278963; cv=none; b=B94uiz6oVr+WJM2jEO0kVsH5tVeH48B3l6fpkyjigVmeIPYpTWgntclAEfKRQQizbR9L1BHaEMrlh/wNt56blVnUD5zsbq5kZ4a6OOJH9wL5+MxYiuSkBAb95wHT3PWYKjGli1H1oQWK03i5RgrGjzHYAgcH2Ed6MYQAQTXvzkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278963; c=relaxed/simple;
	bh=zIbIrMzSJDvDYBgIkEwYRPpVBywOrf5wHV9beNe9Csk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RLpmjBiqrEdvre0xGE8rDfmkbgHF6RzWMvTRCYRUlGn/2JbyOYpe0/RgX304jMo6Tvq+V6MwdNhDk2eNhF8YBO/lgLjMXc7x5HXvJnGuPQyxDb6aHbMeMorJVIO0a9hvVgXFI4jeVpRqGtdZCHE3eq7SMaOkXd7GM9eDxBdVcUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odrr0nAP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odrr0nAP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so1375835e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790278959; x=1790883759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LgnXoD/BSCv5lN5N25xk3q9G7OkECA3zkXLqZfTADaE=;
        b=odrr0nAPoTSuKzIPQAFHz1/CA0Hpmk9kJbvlZlwWe5wp0/9HmWX/nuRDCloYY88Xyk
         r0zhPHaZ7VNzAufUlCwTvUbccTCUBPqJ+byg0xgAwIKokz12P76U09+IDvXbj9P2VFrB
         +TIZy+TtaRWtvKLe7gKBnUuILWDiCXq5seDHQQY4suGVNrA0EZzyk7QJqy58vdXTUV6e
         DVucrhQ1M9YaEL4wfeQl2ecvN/isM9z6L/rOqNodMjiIUgjZ8KO6frBiYMVSmCzP5/Yy
         GOpHHqvx7xPjwiqm/sep2FqjwAqUEEQxEx895zGOsc2Xz6xK15Tp38trWtFjmns9C5VT
         lutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278959; x=1790883759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgnXoD/BSCv5lN5N25xk3q9G7OkECA3zkXLqZfTADaE=;
        b=kNyhNt6Swp27v6vBmYvkB69aYOTEBqTuE211nzWnUqHh7I7sAbD5Bcl1SoHd65Agrh
         FEMmIVgDc42lrw71nI55c/F21m6nK/Qi5LPfLdso7IeXMFvUa2vEPtArC3zmRt0B7Wmu
         Nq7ffhIIvSkFI1YlImJe9G9SMQ++ViS1A0zoKrelA50sHgAx5kNblMv3GTuhUEaIfNXf
         sl/DfIlGFxPXffaB/Q6RBDMZnKsQ+8JJ8p+aTDvpRlQMlE57RGLR0GRlJeQqX0pe/vY8
         2oYf/T+SXbgKwGi/81uk5ezI3oZ4WwWlYAE+BktDt+bOQojQ/wFy/bt2BznRIEtYGneR
         pJ/w==
X-Forwarded-Encrypted: i=1; AKwUvByxctB7k+Ed3qI9YAwEjgmvebMQKpH8l8Z6zjdfdSHsL+1g2POqin+zRgFCaoh3QYvKtX4sGzestr6jEg9osPKiuGuQ9Q==@lists.linux.dev
X-Gm-Message-State: AFuF++n8SszUhXeqTMLj9ZjK9RsQm4FZVahqUrkSJrwicQqIjO1p/MYe
	KT/cJZrhHd/d9gIdSGo91L1TBHkRQok1ZhNgCxsUdM8OgzrjJy5gQssW
X-Gm-Gg: AYBFou0RTuoxnvTfHs4E0mF+KpQG/P6vJG91ogWC4gHhNeMBwHMsd/n3dwlcbgU68SW
	pVJxxMSeCUiss6VZZ4eTOxxWUjsR+Y8PIU7IHlgn5vO0DQt5+iofqS0QpEoZjEekRO8PEQYO30P
	/4zaMcO5hOS7LiBJWU9P2Mzgul4dwO5Iv1qsRiphPbmYzjZYypVKObMmUbcsO4iMYBqPP7hPoOy
	pvgkWIQ4hthf9yp6PNrgtJUc7ozjPl6WFXhKgOAXOgfxytB+LBP7rZTWiktXP/KnzeeVGPM7jvs
	jy77EC88oL3Q/PInrjaRPHi9ugtIkSGYGxpPjwaNDfhiNjidjz4jD/wW7cuHc7Hcfp7PIruCr1p
	n6pHfwO/XLAd4mq6dEhaHUsishAYcXCm3/FzyNsZLf5O6GyXf9imuXdpEMxFbsyyR/4xO71K0cg
	0GsENqrHFguol99gabKx6+KYDwPvNz/ZHCFi+KwXT9Yu5bCy3DQixL859Ao894JgfIXYX1IR0ad
	+cc3BAAIiOCtxnrmKZ7rhkHS3ImfEEzYMmZ5qXbtizTFmH3exZKQ7aqqt2JP85cQMM2p//Dlat6
	AQ==
X-Received: by 2002:a05:600c:5493:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49ff06e509cmr312365e9.20.1790278959036;
        Thu, 24 Sep 2026 12:42:39 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm935105e9.7.2026.09.24.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:42:38 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
	Peter Chen <peter.chen@kernel.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: phy: don't overwrite a device_type the bus already set
Date: Thu, 24 Sep 2026 20:42:33 +0100
Message-Id: <20260924194236.168010-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_add_phy_dev() replaces the device_type of whatever device the PHY
driver passed in:

	x->dev->type = &usb_phy_dev_type;

That device isn't ours.  PHY drivers point x->dev at the device they are
bound to, and its bus has usually set a device_type up already.

i2c is where this hurts.  An i2c client keeps its release callback on
the device_type, and leaves dev->release NULL:

	const struct device_type i2c_client_type = {
		.groups  = i2c_dev_groups,
		.uevent  = i2c_device_uevent,
		.release = i2c_client_dev_release,
	};

usb_phy_dev_type has no ->release, so once it has replaced
i2c_client_type there is nothing left to free the client with, and
usb_remove_phy() doesn't put the old type back either.  Removing the
client then hits the warning in device_release():

  Device '0-002c' does not have a release() function, it is broken
  WARNING: drivers/base/core.c:2642 at device_release+0x1de/0x280
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   kobject_put+0x162/0x260
   device_unregister+0x27/0x30
   i2c_deregister_clients+0x27d/0x410
   i2c_del_adapter+0xe9/0x230
   i2c_tiny_usb_disconnect+0x3f/0x90
   usb_unbind_interface+0x1e5/0x9c0
   device_remove+0x125/0x170
   device_release_driver_internal+0x4e2/0x6b0
   bus_remove_device+0x2f5/0x470

syzbot gets there with a fake i2c-tiny-usb adapter: instantiate an
isp1301 on the new bus through its new_device attribute, then unplug the
USB device.

Only i2c is affected.  phy-isp1301.c is the one i2c driver among the
twelve callers of usb_add_phy_dev(); the others pass a platform device
or a struct phy, and both leave ->type NULL and keep their release on
dev->release or dev->class->dev_release, so device_release() still finds
one for them.

So only take the device_type if nothing else has.  Callers that rely on
the uevent handler still get it, their ->type being NULL, and the i2c
client keeps the release it cannot do without.

Tested on x86_64 with the syzbot reproducer: before the change the first
isp1301 instantiation panics on unplug, after it 292 instantiate/unplug
cycles pass without a splat.

Reported-by: syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3fb7629cfd12d04beeab
Fixes: a8534cb092d7 ("usb: phy: introduce usb_phy device type with its own uevent handler")
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/usb/phy/phy.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 5a9b9353f343..ded18c7fe32f 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -705,7 +705,13 @@ int usb_add_phy_dev(struct usb_phy *x)
 	if (ret)
 		return ret;
 
-	x->dev->type = &usb_phy_dev_type;
+	/*
+	 * Don't clobber a device_type the bus already set.  x->dev is the
+	 * PHY driver's own device, and for an i2c client the release
+	 * callback lives on the type.
+	 */
+	if (!x->dev->type)
+		x->dev->type = &usb_phy_dev_type;
 
 	ATOMIC_INIT_NOTIFIER_HEAD(&x->notifier);
 
-- 
2.34.1

