Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4ED1C2333
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175285; cv=none; b=aLc7BGBSiagyWriZ88sjbVjYktvLDMJkmTW4RiF6/7XoJUquvx0g3GP2WONMoTTEw7QMes3WVI4BGRGMmW42EDbODRoiQxrhhoxspph2a7BEiJz4L1HK4WLUfgdwypooR6loylsiliPhH8gXOn3tA4iYg2v3njpUQ6Vd+uKPMZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175285; c=relaxed/simple;
	bh=DOe095VgAmtmG/Rr+qKsLs+VDn98WoUUMfuTo90VSAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZJ/tfExrdgS2av2qyO2IZe12yUkVe/OI1VU2XOZLdaOXHOeNiDe81+wI5B18exquW+T0+IDVbW8nt/RJ0V2l9p/QuU9T4LI5QYNH4rhM6IuOxK46lJafJ/+cEzVD1yV5szYEnOl8TGSa29G6mwJ3l76YkkAd7V6QNXnifYXNwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDfjWBZ4; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDfjWBZ4"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9E3A4098E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 21:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0geUeoss3TLl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 21:08:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83421408D6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83421408D6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LDfjWBZ4
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 83421408D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 21:08:01 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4581d2b0fbaso1604791cf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 14:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726175280; x=1726780080; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/aq36KinHoVqKCX4QGWHIhVOHyI731EkwzmAhEoQDUo=;
        b=LDfjWBZ4o2INRGm/h5qGkjyQaHSrYWSBnVnGX5k8FuH8mYxE2B0aPR6uBvrtru9wqD
         b1Yt+UIZkNJalRa1clfCcGyqPkzVgLbolBwPCA6lKirCFg6xDJQFyKPgC2ti1p/rqYcr
         qWIesVzZdRp0/ofpCcndWXbqaYrkPU20h2a1d/v8efP/XRKPv1XQcIlEzJrJqb4sX3Ex
         zj9NUCcjl4WjZEk3LIHxai/oHdVMaDFz40aJVQ//5x8HY3xKaKpNnaINiqrEWk1fcg9H
         B2iKacP3OYnfd5felV0QSSaf2BzXz78s9ggwVs8mXJkXIaHEeMtle5MKNr4lX7/Qz24X
         78oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726175280; x=1726780080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aq36KinHoVqKCX4QGWHIhVOHyI731EkwzmAhEoQDUo=;
        b=dQrunl7099VHdmPbtpXZXurESWjrJgHLo+XxPkjHGZ5L1khL60ZOdvTvKG8DOfsR6u
         K/Pp3fuaDmUDuK1eKJCubQ3K3u93Qf2VJujRkM1UW4vkZPJz962+DVDhe9pGeOQdbLsa
         +HPEHw97c/t/3b+inPZIvMKk7c2ywyjKSHKkQP+600yaIaIVwqWJKVyjvdcb6kGxuEY9
         HjtAcYgFDcU5diE6oq/I9J18Tyb4q/OcCAaVNqEHFeOq5jiVgyDCKoL69mHj7lgDQ6aj
         bfX8OTO+Fu6j6GKTz2ZIS8OoEUu10revuC+4+raOFoK+JqHPSnQloSiBGLUDzoYzZ3bz
         KW9A==
X-Gm-Message-State: AOJu0YxwipUzFb3kJbQwic3ZoYLsoYP8ASTmAP3ZpYDpaBJxRLtZ/4PN
	w7XTfc3oysPfot4s8hPgvP2/cN+/RRV6WTaO/pe2eNOH6BaQE+uq
X-Google-Smtp-Source: AGHT+IFZJqS29OHudrWu8tsBBiSakxrEbp4C5mHl0PcTRt3nDXqY7x4EsdbZMNKRtrMATP4mSrzk8g==
X-Received: by 2002:ac8:5a46:0:b0:458:216f:96ef with SMTP id d75a77b69052e-4599d2bbbc2mr7607371cf.57.1726175280033;
        Thu, 12 Sep 2024 14:08:00 -0700 (PDT)
Received: from localhost.localdomain (117.sub-174-193-5.myvzw.com. [174.193.5.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822e613eesm56959721cf.12.2024.09.12.14.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 14:07:59 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Ramona Gradinariu <ramona.bolboaca13@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add I2C driver for Bosch BMI270 IMU
Date: Thu, 12 Sep 2024 17:07:17 -0400
Message-ID: <20240912210749.3080157-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic I2C support for the Bosch BMI270 IMU.

References:
https://www.bosch-sensortec.com/products/motion-sensors/imus/bmi270/

Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
Changes in v4:
- Include linux/bitfield.h to bmi270_core.c
- Add comments documenting sleep functions
- Increase configuration delay to be inline with datasheet

Changes in v3:
- Remove code pertaining to buffer / triggered buffer
- Move register definitions from struct to defines
- Add bit mask defines for registers and replace hardcoded values
- Create macros for accel and gryo channels
- Code style cleanup

Changes in v2:
- Remove spi example in binding documentation
- Add more properties to i2c example in binding documentation
---

Alex Lanzano (2):
  dt-bindings: iio: imu: add bmi270 bindings
  iio: imu: Add i2c driver for bmi270 imu

 .../bindings/iio/imu/bosch,bmi270.yaml        |  77 ++++++
 MAINTAINERS                                   |   7 +
 drivers/iio/imu/Kconfig                       |   1 +
 drivers/iio/imu/Makefile                      |   1 +
 drivers/iio/imu/bmi270/Kconfig                |  21 ++
 drivers/iio/imu/bmi270/Makefile               |   6 +
 drivers/iio/imu/bmi270/bmi270.h               |  62 +++++
 drivers/iio/imu/bmi270/bmi270_core.c          | 258 ++++++++++++++++++
 drivers/iio/imu/bmi270/bmi270_i2c.c           |  48 ++++
 9 files changed, 481 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/bosch,bmi270.yaml
 create mode 100644 drivers/iio/imu/bmi270/Kconfig
 create mode 100644 drivers/iio/imu/bmi270/Makefile
 create mode 100644 drivers/iio/imu/bmi270/bmi270.h
 create mode 100644 drivers/iio/imu/bmi270/bmi270_core.c
 create mode 100644 drivers/iio/imu/bmi270/bmi270_i2c.c

-- 
2.46.0

