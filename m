Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBA7101EE
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 01:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750470965; cv=none; b=tEYK4vvBTvhFE6fk3d3DuN1eNTh4auujUimmLKiQoe7ij7HaMSodujfTi4WEDTwVdjLgLU6/VtXhlQMm90qqS3zkIupRidfZ5B2M+Qfk+srZCbwxHNHSfUpMGBoEq+ZYHe3f40saMDxzPg+ubSSa8kc6f2INoHMhT/oGoPqI8Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750470965; c=relaxed/simple;
	bh=NMF6G32vdf4i3TxCm2iSX0efygVyuLomfbliQ5TJ/04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ts+ilkuUR1TA4ZXM0kqWoX8KzrRxJxEAntP6a+bNd2oDD45fvBzh8s7ATIEzDIHDkjww6t59qSZ8U8c65q14/0WHDJoyysswf/Q+ib+MqPJXEnHNdnDzpFQ6hs9KsfH9LcjaEU2EY94SKM5aI4aZQF8elZVQ0nm2G8T+8XymsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmmHP7Qx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmmHP7Qx"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so4046285a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 18:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750470962; x=1751075762; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKDXqmPoJsPGYezIapXfVxiBd+2xBchIauyV0qRr0zs=;
        b=DmmHP7QxpA0PjgVHlB1+0Qge9p3S4NBXGZiO/nmOJqsQeaD340hsncnsAablvKdwrm
         ET7lq0Fxy+h6vwBBloM/7EYltyUjKSKNGzxDwmoiceWVUsrDtztpa3MCY7iXdbEC5F4J
         qcvgvv2BLxhIrxIw6xy5xBkv662rPHPJaX+IxLKKcUYmcMmMOo2EdEyFPDgSvPLquTi7
         lhJLEdKthvNIEGW+xQ6N2Vv68kb+GDNZsoP9o5h85Z/pVTYOpK0tL76PvjjTZvDhaDa4
         onGM8KsDprZAgFVmfkiYViRIWcIy+yk13WZDKzuv6+hidyoH+0lYwbitQH1wjBvF9m4z
         OeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750470962; x=1751075762;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKDXqmPoJsPGYezIapXfVxiBd+2xBchIauyV0qRr0zs=;
        b=vxdZLf3YLNj70vVhBCGOWAyBQPjA9Fq8oDNU+IstfqtvGtv1IofxTBOlkSVtn9yIAp
         WeLuOgQ+DOg/TUDccfDpvND5s0cZBzx2oSKVHF5eYVtC5i9YclaDeQq2cqefPZnpRLif
         e51NdK5gc2U+/5aZLfiYATKZ/YgHBg2LWtch3BhSR72feR6nZIBFGqp+TuHFhhSCXA6P
         KcJh+I2oSgbfLcB7Lab46eDGaRH7PdOt5GbDfOjXTybGQFV1GNsx23KhKH4s8qfjh2T1
         YbSy0YgoGlg5VjOSw8b1xrTFKXK84A5I9mjKIyb6W81L92I7uhN5mDTOMSCSWeUtVuqD
         b+8w==
X-Forwarded-Encrypted: i=1; AJvYcCU6pTnxo8m/PwAp5ec073qo/epK9nsyEM3hkRcvvBJ839+EWtsJPrP8sRV/wUI6jEVr0glNTL2HrM8BrMdp6ZXb3DN0ow==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4+kAXpkB0WjVRw8ioynMldhoiCOimnJl+nxmOB3HKAvc0LtQL
	/GaYP6Y0Igd8U8eigf9qGdMbYV+WIJ3yQYN5+3gECajm/FoVkWOIC/Bz
X-Gm-Gg: ASbGncuw/bEtmDgPl4C/Ia94fChp3ZSrJrsnMe+uju6MTbtXDsELD97acSQOgH45VAP
	wx9jg8zjeGI3AMvszLxqze7EUPSSnyH++WY7hPElP+prJdW6zKDuhr59LgskFVBwbqZbNOIcVGj
	wKBAQsJAz0qHpR5BYuce/hAxPqTfFT5JEpAaksyytVIc56Uwo2lJwtIgv8aPFaKElBlKBdbltd3
	Eu3PpqItovsZSBBujPDPzuAIXjVU0H1vioxFU+03C5Ih+5yRi645LcJEbIrc/F0tLT2t12uaqGO
	+swZFc/sCzm8UOqStxSgTT8oUHvSc+r8I4VfidYSTS9ShvsYjrxR
X-Google-Smtp-Source: AGHT+IGQGwSpHA5R2GkgVuxhxeakJNAhknYlOERPI26+5SNqpQm9QsPJZiVyJDRW2GjfxvolypcWcA==
X-Received: by 2002:a05:6402:270d:b0:606:9211:e293 with SMTP id 4fb4d7f45d1cf-60a1cd2fc42mr4103401a12.9.1750470961830;
        Fri, 20 Jun 2025 18:56:01 -0700 (PDT)
Received: from localhost ([95.85.21.12])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60a18c94acesm2252267a12.44.2025.06.20.18.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:56:01 -0700 (PDT)
Date: Sat, 21 Jun 2025 04:55:52 +0300
From: Ahmed Salem <x0rw3ll@gmail.com>
To: airlied@redhat.com
Cc: lukas@wunner.de, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit 3be5fa236649 ("Revert "iommu/amd: Prevent binding other PCI
drivers to IOMMU PCI devices"") had an unintended side effect in that
when looking for any AGP bridge, driver_attach() will try to bind to
IOMMU devices without preemptively checking for PCI_CAP_ID_AGP
capability. This happens during agp_amd64_init().

As a result, driver_attach() calls driver_probe_device(), which then
calls really_probe(), raising this critical condition:

 pci 0000:00:00.2: Resources present before probing

With the device being:

 00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Raven/Raven2 IOMMU
	Subsystem: Advanced Micro Devices, Inc. [AMD] Raven/Raven2 IOMMU
	Flags: bus master, fast devsel, latency 0, IRQ 25
	Capabilities: [40] Secure device <?>
	Capabilities: [64] MSI: Enable+ Count=1/4 Maskable- 64bit+
	Capabilities: [74] HyperTransport: MSI Mapping Enable+ Fixed+

As pci_register_driver() calls the device's probing function, the latter
(agp_amd64_probe) tries to find the device's PCI_CAP_ID_AGP capability,
and returns -ENODEV if said capability is not found.

Do not attempt driver_attach() if agp_amd64_pci_driver.probe is non-zero
to avoid probing already present resources.

Link: https://lore.kernel.org/all/aFJOLZ88KIH5WBy2@wunner.de

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
---
I'm not quite sure whether I should have maintained the linked
conversation's Ccs, so please let me know if I should Cc anyone else.

Lukas, kindly let me know whether you want me to add a Suggested-by
trailer as well.


diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index bf490967241a..e6a0d09e115a 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
 
 		/* Look for any AGP bridge */
 		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
-		err = driver_attach(&agp_amd64_pci_driver.driver);
-		if (err == 0 && agp_bridges_found == 0) {
+		if ((int *)agp_amd64_pci_driver.probe != 0) {
 			pci_unregister_driver(&agp_amd64_pci_driver);
 			err = -ENODEV;
+		} else {
+			err = driver_attach(&agp_amd64_pci_driver.driver);
+			if (err == 0 && agp_bridges_found == 0) {
+				pci_unregister_driver(&agp_amd64_pci_driver);
+				err = -ENODEV;
+			}
 		}
 	}
 	return err;

base-commit: 11313e2f78128c948e9b4eb58b3dacfc30964700
-- 
2.47.2

