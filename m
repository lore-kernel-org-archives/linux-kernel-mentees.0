Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8064518BC3D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755133; cv=none; b=N73cLnx4okM74UHOu4y1Q6clCmTNxC8K3OlQ8RIucSFqLCjJdHsnQrMCuZZ2HVJTjPQXA3sjhCPNE8Zt5x4AXnT3G3PBElpqoKLpQCIjFiJ70m9XKQ5B5vKqJGUMo6ePU7KhvHSXcHG1cUMMBMly19Wr6qGEByOb1EDTzqvFYfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755133; c=relaxed/simple;
	bh=Pd54fnZYvN0IF3kAJsE/tgFL69YD0dJcke+lyp9URmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzhDxPWrKS72LqqOr47v+RkY/0Br6cOkxoYIraFztvs7hugmvylSFhxtJtUBkPkhoqaE4wQsPYerMuYjbggPs1q4U8S44y4FIc+jhFHfScgGtlhYddVMu/up4kxkcP/aedcXOjo4LuJVGiN9Lnx4LEqBP725DnVDJTn85GOylCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THfNgftu; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THfNgftu"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052EB80F29
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 08:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4zuzKEiXelC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 08:25:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=x0rw3ll@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4963180E80
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4963180E80
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=THfNgftu
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4963180E80
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 08:25:31 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso3382366a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743755129; x=1744359929; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uH1IX2xHGor+jIVcJKBUYPSchHEkklHprBp/7Y2BGQ=;
        b=THfNgftuS+NVjcVtI+QBhKcB9npW39yBjWW75GyXLl7d9KYAXkrTIxoMsQPCUVvX7O
         oUi47GguHI1udtwoF+CLu6urdUelDSYvATgazqxRwHGKxDCl7bJ0p0A/d4mYX7oIG18l
         T6hFAJMn5yDQJIJAYPLwz7pqcTO2s0FTgghpqpaH+DmGEzVnW4NJ4wpmxkuSRtyLjLUl
         kYdDfAXyOPSwa6pYwDBaxoE0jhRZRzjOF4NC+43C8GUj/3yblIe+X2Sgnwjx7h4wffjU
         ZNal+Yyz03VJBY3H2zYppQyy+vBh0UdePljYyeSkgKaQTVu2uxrRpKqOa7GTQPFD/eit
         AhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755129; x=1744359929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uH1IX2xHGor+jIVcJKBUYPSchHEkklHprBp/7Y2BGQ=;
        b=ob7Q/PooiqEyV+6tCSBQMEyQ1IfRSBbMb+qRGypGRInUJFeKHSM/J8nF6vLd2Zzq1j
         i95pNWH6vSDc2STMhrsYnEDx4n9OWC/8dOu2JcBdHg7TadgxfvH4Q07Ylz/J4QB3I1yZ
         CVLEbW9XcQsgQgsQbnRBgyZ0LddrEP7qmbHhwwL+sPnCQ2NLGX/ohDxeKDd7VW01blbg
         g+hb7awTVGH+BPkqYxWsigjnTDi+rMVHSmbcZ1os+8vPsN/6yNTwioG7UGFX3hjcQOVF
         1yJoQyeNkEhGI0M5oYoONUZu2Uz80VW5+MJt4qUxDLu+W/ddIRDPp9BT4CjuXT+PrETx
         j+HA==
X-Forwarded-Encrypted: i=1; AJvYcCVFZZUHSMFTB+iAroSNqWEifCGTx/pJAJnPTD2ueGpJEUCuREc9VORE6rMiEOM/Qa4xnTBuQ1xvaW3ZmXs/rshkS9X7UQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyLlI2Ny4D39EKMthFg67gwPgOy3D18A9OVTKHNGGGlNYgvldAK
	tey0hN0RXvmGgaPiqStfor5EgZx4qeAROHTR0aRdZd7qrQH8mXkL
X-Gm-Gg: ASbGncvgDm4EndnOA9TYSHo+sbnCmGXPd/EMHD1HaFLVife47SewsBHU459zMPiersm
	zbpbi0UhScwJOCO1oM+BGzd5vazd+aQkF2wIedy3rHqvj0PvEFQqQdJFwSPyL274vCjuKbRANSB
	CJjkPMCvFQOsdaodJ/nlapl7NNrHDj9PZiQ2WC0ZHyjjH3ty2WjAYeDxbs9MM2aWBwIQo4Prq8u
	ycJGqoY8VwTERVWz7NRRdwlrnhUPjzg/tf9Sxspykrtv0IgW3SwUg1PbVeKwareFSYHMgGv6eLN
	hVbB4wz3YO7FSWW2vdWFimIxtr84prbZTg==
X-Google-Smtp-Source: AGHT+IFVdlyUKzMf5Pb5awlp9iNJ1Cr8z/mFGTAH8E9fTJUEvs97KMGKq+hbLu5ymPdFCE1kusouSQ==
X-Received: by 2002:a05:6402:51ca:b0:5e6:23c:a242 with SMTP id 4fb4d7f45d1cf-5f0b3bd0a10mr1826431a12.18.1743755128931;
        Fri, 04 Apr 2025 01:25:28 -0700 (PDT)
Received: from localhost ([95.85.21.12])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f087714df0sm1954318a12.14.2025.04.04.01.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:25:28 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:25:26 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org
Cc: skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ACPI: sysfs: apply ACPI_NONSTRING annotation
Message-ID: <dcc3a018fb28899b277df2e154740d59d4e404af.1743754416.git.x0rw3ll@gmail.com>
References: <cover.1743754416.git.x0rw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1743754416.git.x0rw3ll@gmail.com>

Mark ACPI_COPY_NAMESEG() destination char arrays with the ACPI_NONSTRING
annotation.

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>

diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
index a48ebbf768f9..8a5af261129a 100644
--- a/drivers/acpi/sysfs.c
+++ b/drivers/acpi/sysfs.c
@@ -307,9 +307,9 @@ static struct kobject *hotplug_kobj;
 
 struct acpi_table_attr {
 	struct bin_attribute attr;
-	char name[ACPI_NAMESEG_SIZE];
+	char name[ACPI_NAMESEG_SIZE] ACPI_NONSTRING;
 	int instance;
-	char filename[ACPI_NAMESEG_SIZE+ACPI_INST_SIZE];
+	char filename[ACPI_NAMESEG_SIZE+ACPI_INST_SIZE] ACPI_NONSTRING;
 	struct list_head node;
 };
 
-- 
2.47.2

