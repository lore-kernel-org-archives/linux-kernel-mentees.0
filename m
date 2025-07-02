Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9887220F51
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Jul 2025 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477837; cv=none; b=KjEiFZ3lnoQZr2SEPCS6YndTK2Z26aMjpQVCLJiC0Wu8Nj/XFTZ6Fxvuv7UgUqau5ZLeFAz64eZEqRq021qQjGleQfD0l2848Pa6REWWP50iKLEmjA7iRsowO8owAhOyJg870TqCZTX6shcwMrxV21tzJY7xUQdJTXe/YWrSC4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477837; c=relaxed/simple;
	bh=+3iu10ARXrli6aYGeWMSd0G/SI4ynrsF78F10CwdKD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYd/Ix2ZmHR5UR06Uo7FoYInEwurN0FUxC1TJIJIfIwJx0Dek+ehAPfPAl+cd5BiEtltyGoKWQkWIsd+IQOQazGisaCBzX4HE8eVxjnLtXJmPGlsvvLioYsE11iMBYmhgNB4AiRpIo10W2s1pYB8pJ3E5FKhwZ0I1pYy5iyT1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxRdJf40; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxRdJf40"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-714066c7bbbso80943587b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Jul 2025 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751477835; x=1752082635; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3iu10ARXrli6aYGeWMSd0G/SI4ynrsF78F10CwdKD8=;
        b=VxRdJf400EL55+eBj0z0E/8t2BxIkc4sO0XHMuZorJd3zeenOx7ssDNKdN0MlkSfcF
         VqM178w658AFJCl3k2OLYuDogwfpAEccddiG+ER1/MZ/FIokAVIM9cGlz6Cv7GWL0wko
         xYEKekxnOIUh/MxQ9y6Oj+ueeMslQfeuYJ4gFH20oApu0NfPrJKlKbWbSW5V93HANrh0
         bwAL/PpQV7qN4P/A/25ArOtjk1xq3VS626UJ0xE4r5fENCVqUEtgFQDv81ZSNgxTUi/T
         ZtdFTbjK9U206wvuofgeJTukS4Yc0+WdWXlt0VktBXPm9UcSzV/8CSCMdtNeLOiD/LLL
         M5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477835; x=1752082635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3iu10ARXrli6aYGeWMSd0G/SI4ynrsF78F10CwdKD8=;
        b=Q2JwnSsC/FWxUxqTWf3/LoROK9fnXPk59moy+uPrm9T6vfhT3nq1lRpvNs3ubc/oX6
         xp9z17WY0gjfKHYGMlKUWlgJ/m5/rDaKQr0DOY0WMVpFuTx0q317dMztS6XPfqEtiMNl
         aMqfQT61/etgFlpb5amWW9e3AKf0VeTCHqEKPZRie8Zgea5KcrO8IuoqycsXcJdljaEj
         g9zGdw02mtzMOd2jWGFMNh2RkD6lVVmn570R08YtBaKuWJDyN9ZhNJLW9f4AJ7kV6QHc
         1KCTQ/dUaHFKUi8hT+HjBrKuZlfDED/Ed2T1idvvsj2L0p8gw7VQOzI6pi2WFXHVIcuq
         vMAA==
X-Forwarded-Encrypted: i=1; AJvYcCW6qdWgqv8eKVBW+hRsS4E58JkNQBWhxfxV1c5E3W6oDn/kwj3zQwHNgFbVMK0QRF9Mk1cV4asuct8+mfQJVqeu1lzHSA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxtri0TlbUfHxhL0NfJLa1I7o6xWK6xaYPp1mIxTntf+h1RT/W
	eP//1eudBu0DwvzMZIujzztneT+u5mXgmhpKIBAE+LP1Q5K5uNGrYQzF+3VKK2mRJoLX8/aLsoH
	e8RWR8BYgxd2mOirlkR3RLkE6DTl/BEg=
X-Gm-Gg: ASbGnctZ+2RE3zav2z/IgIT14FwhB14Ojk4MDWMX4teLi9IlUvFYR7d7OBXBDMDkQYf
	7c02vRatfLg+3IHxzyxYaVqVbJ+TTadI+atCqfLR8yzY7hMk5MQLHraDlxK2pbG6GoioY6yrGSh
	JQRX+CjVVVSbklwmhBfwE6zlP70cd1ek9lW5HxE7/I/1r7qdE6zEkDJzXkhd5PKW0eYCaQM+IqS
	f2G
X-Google-Smtp-Source: AGHT+IG65yWaIH+GMe5uFx9j4slTz+xcfrbtnzt86UHGCPNc2S++CK6rMAk8qWiyENa3BvDVqurWq+l2oPlvEZC1Mro=
X-Received: by 2002:a05:690c:6886:b0:714:3e9:dd3 with SMTP id
 00721157ae682-71658fbcc71mr7959357b3.6.1751477834545; Wed, 02 Jul 2025
 10:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250702171704.22559-2-moonhee.lee.ca@gmail.com>
In-Reply-To: <20250702171704.22559-2-moonhee.lee.ca@gmail.com>
From: Moonhee Lee <moonhee.lee.ca@gmail.com>
Date: Wed, 2 Jul 2025 10:37:03 -0700
X-Gm-Features: Ac12FXxSvmf-vd0t6RoDD8VwiJfrWPOWXyAk3_FBBMmpe3i4cdXWTYiNc4YjfZE
Message-ID: <CAF3JpA7q6WRMNar-EqOd6afTogyiUoRq+GnWp0sdv5rakLpsYw@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/kexec: fix test_kexec_jump build
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kexec@lists.infradead.org, dwmw@amazon.co.uk, mingo@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 10:17=E2=80=AFAM Moon Hee Lee <moonhee.lee.ca@gmail.=
com> wrote:
> ---
> Changes in v2:
> - Dropped the .gitignore addition, as it is already handled in [1]
>
> [1] https://lore.kernel.org/r/20250623232549.3263273-1-dyudaken@gmail.com

Just noticed I had the wrong address in the To field =E2=80=94 the correct =
one
(skhan@linuxfoundation.org) was already in Cc, but sending this to fix it
properly.

No changes to the patch.

Thanks,
Moonhee
