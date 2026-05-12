Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC333AB26A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625146; cv=none; b=EgdZhwc1Lm+CllJMczIco8YYVqLR3Po0Dh65BeEtQL4uIYGCEPkjEf1KfcYVF15MAEz7hREMM6p/aYZjXF1+P4dwb+DC235YLUOBl2044JC6Pz2YnJ0Cfg0V4Re0wzkVKkpUOY7YW2FlEINeVZuElyE2G2YiNZjhY87uViJ9bjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625146; c=relaxed/simple;
	bh=Ypvnd0yZE4xn5uhz1eYcWrsIAdyROX4VSJlgjqYpqbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5uw9Ipr916StYcozWpMUyzqiuhllhtC+oisCGDzfspdhJywgpgOCO5y1uxik07w2fINS2PzV2mi/NRwou/gq9NCc2aZfHWm0kH8vfyoytDV43LdoOSIFl3NwSktv04doVePzjLebw7i8BNIMrEaqF3ifoUCLMDVgRn7iJWRkmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPhdrw6D; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPhdrw6D"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488d2079582so63722645e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 15:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625143; x=1779229943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yma1oPBkehBK4buQzFEzmzdCN8nBmPqJCgl17N+SFiw=;
        b=UPhdrw6DlzrUTZF5SYNmWG4EYYjiTiEpc/pvu+I02gebBTMWYResvX9wHvqUxcQ4/0
         jOdwvi0v37+WrGCaNrd+9JCZvfsqyNkaRoyK5FLeJEYn/AXdMzQeV52j5zT5+6zBafbl
         LUoW8AEdYnNi21HLs4hPpmlH0Oj4MbkUJQE0154GiuAjkUt/KtafM7E2d+9vND9DhZgu
         FVZjMnT8YkYFotXeZQ7Q4JjQ+qbcKJuVo2Rn9NC+cWeM3OqYASVVmvjBcWGuYL0nzCg7
         Sl1W4Sw3sgcDLWdH9fGRSczzZoMwocrgkPo+dvSG67jIqdci5dLiqM+l729/K0S/QDCl
         EDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625143; x=1779229943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yma1oPBkehBK4buQzFEzmzdCN8nBmPqJCgl17N+SFiw=;
        b=V3G5PiphMB7VJe2UdUBv31hvSYYk9n6uRPk3HWNKE7VURX0IXJMgnEUQdgNSXJF5wO
         TLMcFTNMEJZzIMXc3M/jur8ap1swCH2xiL4Kby5GNlUX78AtnDwoxc7HAF1ntqb6JSJN
         SAhMJwYksOUbrDtBSm5RURXN3HDZ9eHCfmB+9J8obptwGofY2IW1pYivX5vlFRVAU0wh
         WqDjgtdaDmLp69mVxi0GwEIf0A6YFkwX7UGX+MvZ5491q6k+aQWa7GBlLVeBkYmz37Gl
         cOM1i3F56tawTytSrd//9Aw5fkFUCHOFHOVjiV+r0GUr6sSgDN3Jha9tGsyZwcHSmLgJ
         yJoA==
X-Forwarded-Encrypted: i=1; AFNElJ/J2fcDeNXZsnJhtqauOwNoBGYPX031Eiy9WNTbo24U2Ob2sgaKnOEgKRlKB1aRbSsgRyJgImcanAO8MVzY6fwj0bJBKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZQGFK0mZLlOjawGovsxE3X/F66OQo0Tlc9lH6Dex4dJGx8U0s
	nRD2PDMZH+7HKru1vr2u1hOOgTppDybEYSNm7Z/2B8sFzRM8rUJd7GLl
X-Gm-Gg: Acq92OEhkR0JO6OhbYMCs8Vuvnvwp9u+K3k/I5Je2uePxFs2yAtlBxdgCsmHLljMZy0
	TXMJzWrSP+BWXFq0jWna5FahIauQJ35AvIcUHgHRYtS/MznLzwoiFsLf2iRh4yiVeA/kJOsseUR
	XBD5i3Xx/PvvifHf2CUGQ32jkZIvAiNudwRcs1yKFELtpzd8iqs6bIc8BrPihTcFsuY8pLZkE2I
	XZFA/7xQhDaySrHirgY49PkUBhlhycbwC9FBC7g9uneDlFlZIHkKq+fIyK6MbFpdGEYonmDwCic
	60k3O2IKeTnUsh5QgN1FaeFe9E3P5nZcmHXLkG5iO5Dkx92HeY+lxCq9pEARRqzk/hdbjgKSL4o
	eXjF210/0ZYBeQesX6sszYEtVdOHwzfGRv+qay8GhEGJTDC3wvf2mBbk2G0Td7gSJBYrv5Fdu24
	xVNUoEWfex0E3keznj0puaF2aSZ7WHgvKgr2nuEQJm4vurSpyWlp9N9lA=
X-Received: by 2002:a05:600c:a307:b0:488:af48:af11 with SMTP id 5b1f17b1804b1-48fce99da8cmr566825e9.1.1778625142927;
        Tue, 12 May 2026 15:32:22 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3c65f2sm47377375e9.1.2026.05.12.15.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:32:22 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 5/5] iio: light: tcs3472: move standalone return to default case
Date: Wed, 13 May 2026 00:32:15 +0200
Message-ID: <20260512223215.25596-6-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512223215.25596-1-aldocontelk@gmail.com>
References: <20260512223215.25596-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the trailing 'return -EINVAL' statements at the end of
tcs3472_read_raw() and tcs3472_write_raw() into explicit default:
cases inside the respective switch statements.

This removes the need for a separate return statement after the switch.

No functional change.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
 drivers/iio/light/tcs3472.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index f8f70399a4dc..4ba2def244b7 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -291,8 +291,9 @@ static int tcs3472_read_raw(struct iio_dev *indio_dev,
 				cycle_us);
 		return IIO_VAL_INT_PLUS_MICRO;
 	}
+	default:
+		return -EINVAL;
 	}
-	return -EINVAL;
 }
 
 static int tcs3472_write_raw(struct iio_dev *indio_dev,
@@ -344,8 +345,9 @@ static int tcs3472_write_raw(struct iio_dev *indio_dev,
 		return -EINVAL;
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		return tcs3472_set_sampling_freq(data, val, val2);
+	default:
+		return -EINVAL;
 	}
-	return -EINVAL;
 }
 
 /*
-- 
2.54.0

