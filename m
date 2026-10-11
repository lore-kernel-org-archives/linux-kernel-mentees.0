Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A33DFC6A
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 11 Oct 2026 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791740938; cv=none; b=Xh2xFOHdbv6l6/RM3T+60Blkqwq64q7alE30RhoZEiDDi8xfbexADv/IU1nY9otDxkBCDI119qYPLBa4yeEi0JvS27HVG+MzVp8KfIEdDgFm6OQEav83RHwCeEmlwyGAhiSbOatq4sYpy7LfsNRWs5HCti2FE/kHLSrwAo9wArc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791740938; c=relaxed/simple;
	bh=+ac6ZuafHdUeOx4kM7JtsJyMiC3/HL6rFzc5v99ZtBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OWDUWK+ojnnDXO2RIJE9gmhIQy2vBi5roJ6494Ll4/IhhkPXLa+8KfNyA3N4UobCPuXXorwetgD4xANbKd0yZovkKJUtdJCPI7gbd2wFY2crO8bYo5x16jn3jyce86ZSqNBNsfPQcarsGe9MExysh5aHviX+F8nsqYdGy8esaLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=famphMlv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="famphMlv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a020e65269so6813015e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 11 Oct 2026 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791740936; x=1792345736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lnKvaxco2zJAP8jwsjWRlSJGBk6Z5phho18+IObWBjI=;
        b=famphMlv5krjRRuXhVXJ7Kj92r43hwfhHKAz6Y4w5tIY39OZ7QuwZU3t6CdiNTZDle
         wqjfG/kN7koMVr5g1+YJM8B7fvKlAideNf56xv+TC+LjIbEkeYor0Q0mxiav2Dhl+mWT
         IgwHwwSJgWyYYRviDSrV5MTtzR7x4Wtpvdm/P2McGYxV036o5oZx3UliBGyEczCr6stP
         ND7mNj4qcHuoH0lcJh0Cm1VWGGxoNohOq/C3as3IBfcwaqrqCnMLWqeerryGlqQlYoqT
         3mq844nbm/e7nAuX5snqD3DXi0TqzfRdUN9RUqfEFTffqyc23NPWeqxChyxNw6Hyg9/+
         KjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791740936; x=1792345736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnKvaxco2zJAP8jwsjWRlSJGBk6Z5phho18+IObWBjI=;
        b=nD8rZ0i3XJa4uRtGxGSkdiwb95vA1ZRtdBQN48PEcs6HQWfHFevX/aPp3fhnKYxkBV
         hr1yryqMMjnYw91RTTu36wkdno/YriCyLnRDKKtqjNGUK4GgyX+k0w9Tt/2ZUojSl1IR
         8Z9ISW8Z5RDBPmh8l/nmw7QmKJH8etz2RYdaKtgSEIXiwayFAYQkWwXqWkLHEwgpFZcg
         /pAgY8GFhlyKhAMXsTVa6GoKlTAL5fRUrnH/OwUu6zHEghu+s1//EoHs7HdeZvrcDBM2
         ZMn74R+v57ml2BhFtNEquVUiofYzNSv8Z1uSHo9RbafmcvHU1p9EiGd8biY1CTYonETu
         hifg==
X-Forwarded-Encrypted: i=1; AKwUvBwkZqx075enzq9q5RK6HVykvjanC/dV6LlkQJPb8keovxm4DZEw+/7bVGMQjUJLkevQUFWWSPYVwQS5N6tItb75JofpjQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIUKM5ZHicK6hSAw06nm2UaAC1pydQ3QJyoDQoDVOgne9+KshQe
	61EF8C42aTKhifXusewivBLzNXtMHRCpT5g+ncRlAzid1GRyGFLy9p0J
X-Gm-Gg: AYBFou0o3Oib2HEi+ZMziz0djp6vwEvOHzRqOXiSyzMqbmsDHlbbzpjFOJgoqbuGCY5
	FijPkwJKbJ75v4E6BWzUdMYcDiJxqA71rlHWY8W3f+cY5Ahf8Hy+CY8ilM71N6vn2WLxg50p5Lp
	18qkbiltWxHlsPyhJXv48HqThfPet5dosrz/CFwYCLD47mB6hH4Ya6lsMbO5njNkdhfNkXO3S/l
	djmzc1R4WGvatIDrEGX9fbwjLw3rEVmMV2nItrzm/H91tM3+56DhDDdU4zz6TnbgNQ7QGo28cUS
	ZnvEhf+XzffS+74eV9BnI625d+iogGZlWrh1Xc23g1x9IKAjtpCJzPCgofN1QlBVcFtFuQjAFcW
	glzCY/YgAa1GMbnXIbE93dtcsLF/O8EgCx0EO6VP4CNVF2Ub9++18pO1v+FVAcn8Ab7Za2GYxsK
	IAjYWu6EOxspaHoRI4J7zW4Dpt6DEVJfLDPffVWPmqZeHONTsYKopLecMOQxanbVr9aHj2vrpZF
	9am9i4TL+JM2VNiTIV0b446L56p05bq+3DfgmLVQZgm58+E+LMFs7o4pttSFxIbW90=
X-Received: by 2002:a05:600c:3e8f:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a18e44653cmr141326245e9.4.1791740935316;
        Sun, 11 Oct 2026 10:48:55 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm249995755e9.11.2026.10.11.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:48:54 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: phy: don't overwrite a device_type the bus already set
Date: Sun, 11 Oct 2026 18:48:53 +0100
Message-Id: <20261011174853.59234-1-raghunathpalla.0209@gmail.com>
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
Cc: stable@vger.kernel.org
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
v2:
- Add Cc: stable, as Peter asked, and his Reviewed-by
- v1: https://lore.kernel.org/all/20260924194236.168010-1-raghunathpalla.0209@gmail.com/

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

