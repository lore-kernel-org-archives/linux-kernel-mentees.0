Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED2126AD9
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 03:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758078714; cv=none; b=B6HI0UiG6NquqMFXg0ZSghqtAcynFdxLgfWIVh0JEP4NAWH0n/lbPQZ6e0wqLB0dEhJ6krHmHPbMt4ema6M9eiOLftYEJ7RJ6LE36lDJpJfCiEkQGr7W3irlplg2kpF+ypfXKsqp5TT9H48+rxShbQqWSYwk4riuML8vCPf+Y/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758078714; c=relaxed/simple;
	bh=5UBef9vu2NhcFxgKr+tAHWOrdUDeityEZoYhhezBZLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G30v966cV+ybhnD/BdjfU0iG8Eq4wSC4oKppqE8EDbfXd0Nx5XyjxhcPpoSfGlEDfTBTDdOkGBzC5xMBk4IUih71ZfB2Z5DT3szPulZ4weB5whnPeQUPYWdZnfgvwm1hnm9MmNQaEphuR7aOmI8oDumLF5gsWIeTKiu5ZmWd2ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xpp6V9EW; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xpp6V9EW"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4c29d2ea05so369128a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Sep 2025 20:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758078712; x=1758683512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2CbSn2515ReZCKkrbmHpp+wPD4QyAtOFfge6YaI3IA=;
        b=Xpp6V9EWUNvWOxxF2x14fV9tZTvWb68LDgC9oAB5XwnjxYh2FBRtazwX3FMbJy1W+w
         4cI6CL0YjQV0R+PzvOJ1AKydoKWex/3XUIAc2918sYVRJiXKLpoKxnsAt54Y9L/xRX3k
         XjBr7J49YUqPa9lUhid7pHCFonNMDQRm9FJEfs2Ts9VmyOtOzdMAiOFVOB4hiI70sutQ
         BqdO5ueKoG5IJyMU1X0qIKstfFhIlE7OdrDHk7P+nOBqWaU+RIOHOjpEdjGfxHYgpKdp
         EHmnDsIJz9gmMOtZ8P9whsjSVJJbWKK9FOSMPO3u2fzjSLN0nVrggJDY3usALp8xIcH9
         fomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758078712; x=1758683512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2CbSn2515ReZCKkrbmHpp+wPD4QyAtOFfge6YaI3IA=;
        b=XBWXCmJelN9MgDRSSxMEIqy4yURk4lrlvHoEudYH83uM0FvJltJqFb2az5ihOHgNj0
         4ZIjyXy/62hJUfNsC2WdIlqfFZlEcN1khqWSrwFvYtffWHhkBxfd1B3YSjoH0FAMd5Zc
         1+upLaGAVSlIs6hai2vcCN3trn0rzivU8BGsy2y8MewmvKEeXXn7tAoGALJ6EUsHQ1ij
         arekJ3rRKGCFMUgfxHEV2ogDDiqFypaOEi8JdBD8ygsDrL71y5SqWwppxges4/TSkUa4
         EHtRANhrEDsa9odDVpC4aJEWPO0GzZsCJ9Te5fy102acN1mLNV4xE8Y36JSey3mC3PPM
         7tMg==
X-Forwarded-Encrypted: i=1; AJvYcCUIPJL5oFT1WcTlf2Nxu3RdrLqFHVhnFVPbMB3SwOTVf+n6Gdp50eE3Nm2t99Jf8SyUmPz5gpAR6TIP9PpA9EGu7ZO6Qw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKaKQfWiAI6SjwzwAkiiz3QeajoNgeriPNhfUssoD2H9XINpBG
	NWiNmdpItqYj6OfLDOTaJ3Limp642yGLREZlkONpx6tPNHTuQV+4odPG
X-Gm-Gg: ASbGncuaWxvFy+lNPkRPUiLBRa5eOzBwg0yZh8LBkPVIJQe2RENlYd56oFqmD7FnjAK
	HAk4mFUg1JGX2g9WRqppzI6/+u2DfZpotFYE5R55HyDUVyDRgmtJ72nYi5UjgyXctjgTj0t5XzH
	pP+idnBGwtzOrSILYPue/HAJtnow941PTMO+PiOqZZvNNQgx1uJeYvknDW1Lzw0lTdedB3f+DHF
	CGG3ax+QKBgKsWKItpO1bZgsb93Nbs46Bc5Ip4nGRCue8TDaI8wjya8oJqRRV0ai0MsYlA29v8i
	eADQ+MyzOdUNJKyaR1szD2cUSgY8a8VJlG++2HUp0GfWMe10JhDmmESRyv5TJKA5KJ+kawZAfFB
	0vecaEuBvU9QRJA6xHspf0rzKifVr55NtzGrmK60=
X-Google-Smtp-Source: AGHT+IFxgl/BG5mxjVo8thexM0dPU/TMGuSPr1BRaMhSuK4W+0tVzFU74sMYhTzjjHSX4kIO/Wb12Q==
X-Received: by 2002:a17:903:2f87:b0:24b:1585:6350 with SMTP id d9443c01a7336-2681095771emr8388975ad.11.1758078711935;
        Tue, 16 Sep 2025 20:11:51 -0700 (PDT)
Received: from cortexauth ([2402:e280:2313:10b:d917:bfec:531b:9193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-265819a6212sm82217505ad.57.2025.09.16.20.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 20:11:51 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+6c905ab800f20cf4086c@syzkaller.appspotmail.com
Subject: [PATCH] drivers: core: Fix synchronization of removal of device with rpm work
Date: Wed, 17 Sep 2025 08:39:55 +0530
Message-ID: <20250917030955.41708-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reports a use-after-free at `rpm_suspend`, while the free
occurs at the `usb_disconnect`

All line numbers references will be for commit ID
d69eb204c255c35abd9e8cb621484e8074c75eaa

This points to a possible synchronization issue. In `usb_disconnect`
there's a call to `pm_runtime_barrier` but it does nothing more than
acting as a sort of "flush" (while cancelling what's the pending
rpm actions not started yet). There does not seem to be any increase
in device usage count either in this stacktrace after this stacktrace

Then we have an eventual call to `device_del`, which further leads
to a call to `device_pm_remove`. No code synchronizing in any way
so far with the PM system after that `pm_runtime_barrier`

Let's say now that the timer expiration queued work for `rpm_suspend`
executed in this period of absent synchronization. We can create few
interesting situations here, I will address one

Let's say that we unlock the `dev->power.lock` at `rpm_suspend`
work at `drivers/base/power/runtime.c:723` and then the code
`device_pm_remove` proceeds as normal clearing up the device.
Any further calls are not going to cancel the tasks we have pending
and since the lock has been given up, we will proceed, and end up
deleting the device too, which will lead to a use-after-free
as observed.

So at the device removal, we could add a `pm_runtime_forbid`,
followed by a `pm_runtime_barrier`. This leads to the completion of
any pending work and forbids any other new work to be added.

Once we return, we can do `device_pm_remove`. `pm_runtime_forbid`
does not seem to influence the behavior of `device_pm_remove`
(tho it does lead to a call to `pm_runtime_get_noresume()` which
touches the device usage count, but it would still work the same)

Reported-by: syzbot+6c905ab800f20cf4086c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6c905ab800f20cf4086c
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
 drivers/base/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d22d6b23e758..616fd02d18ed 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3876,7 +3876,13 @@ void device_del(struct device *dev)
 	device_remove_file(dev, &dev_attr_uevent);
 	device_remove_attrs(dev);
 	bus_remove_device(dev);
+	/* We need to forbid and then proceed with a barrier here,
+	 * so that any pending work is flushed 
+	*/
+	pm_runtime_forbid(dev);
+	pm_runtime_barrier(dev);
 	device_pm_remove(dev);
+	pm_runtime_allow(dev);
 	driver_deferred_probe_del(dev);
 	device_platform_notify_remove(dev);
 	device_links_purge(dev);
-- 
2.51.0

