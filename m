Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DAC388393
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Sep 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573891; cv=pass; b=EOi+IGQZpul5+cEX79kEdIZgI9RpCHPaCVTrthq9G/ycusG2iOog5pLG71BGDC8zYbg5GCbAviNaOvcAvreHjb6ubUs429Tbg0wgOXNjhWqj4MVVJ1kpajMaSMlhwhui63LC0hhZlU7aw2g56xHTm539VmqrhFO1kpEsk6B7C7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573891; c=relaxed/simple;
	bh=bo+nR5vgnm+LSKdCiwZsyqB138gI9BLV55OIiNb16sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqfIc3EIVzINLEp93dOL4NPls2Cf1ymcy5JRQib2xndlTJKs3oWAcBKUwvTgQuNSKRxJDoy++Iz1B92LnzU1CelS3ByaqhLhaBbQNXH/gVL3RU4+hvCweodN1t2szq/Tg9CTqntKaLAyRcVA5C+dK8FCi+f7BP6w9Ug+uWeLNT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXaIFQCG; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXaIFQCG"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c9ff1fso127303585a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Sep 2026 08:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573887; cv=none;
        d=google.com; s=arc-20260327;
        b=QwpwCaZWrsOOnkgXd4DX2liV9WDSvu1PF+x62kVl6RoPNI4d4pp/bI/krTCo0+gah6
         1N0KnHlgTIUTC6lbjR/L/5tp3eTLrqX9iCT/EHGxY1MXbF+pd7AwJX5PQbbuUGEY6/Us
         LEU5LKTIGzX0MHupei3+eKqmtl0sE1NvkdmvUGLTPegbp62QLnKWI8QVi1LolMMzYujT
         1O/jwN5wgWJ7EX1SnquAlduVV0DN0ZL14mDES4PhfpXuiGILBGEsnZJTbDI1nbuSa+TI
         AsUfEs85ifWdueGSGuj5FjMW/JBh8IZM/F8blbaHhEOYN14geeEsKekxEuyxTGAzcg9M
         D5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        fh=jsh0LGW3DVEavMKjeZbV0nrFWxHvmrQ1rDBaUxOnV9o=;
        b=R1ROd86/pbtQo0wLqFdI0Drm6LuEkKJjFy2tBgzJ3gyxCWWRzNGqXlCkf9TFMRqX0G
         m5YkgC/TDRA7dSnvr/DUVHAHVs6kCUQfUvg3X5edQJ5ppNeSV+Fhi/p+OhHRw3WAGAFQ
         0Ulg/91i9YM+bU0sHt/Sg+AtiE6Shb3h8fYtKSPywBRyoQGRfwqqH6kShxiHvr9S+EWK
         6vDEZExl8HJXmI/SF9TPT+uT0I8FpUYzul67RUTTA8nQFhLvpJUku7qoUBX5wVj6GTn2
         UwxYEy4fmt0KtHe/H5kF4loSUI9nGcJczq4TMZJaDNHoKwfFK6HWbtcVcPblLFHfeVtl
         xBRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573887; x=1790178687; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        b=fXaIFQCGJDbUyLhVvoj/pnwVsSIXbawBgemvJMO0wolY/iXwcnfm/keXHNJbyHUCMS
         IJWYs1cbvFskNkqIYMRzqsMCJmMG+kRlpgmH4qWKAjy15HY6BD58yO5vyuyEDMMVT5Q0
         PHxdoFtNt94V6eRAEb0cEgL8SdGzoNGVZDoGW8RrKeQBCadpsOHKBF+qK4NtAqGMB2u5
         VWmPLs2Qg+3qY91+mUOP+qJcYtR0PuLI73sodYs4w5CND8hh5xeYZ67etcp7s5b0JzJv
         TZLcjtf2jlZ28FOEgB5LuHbx8cveBdZVyB0V/LFbGutQnkbTZstYaZX6fxbRTtHQSpP+
         wdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573887; x=1790178687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        b=TGKbLhyJ2Y5TPrDG0ucQFZnkzHVaPRbXIxa8MNJKuxgSD9K8nB7s9AW91KP1YlvQ4k
         Vvn0YkrARGUH/oKP15VPI9tMf7Ww2GDwNbnnynZ+G8EpSyoYCl4Dn8urA5VXMt9LgbKb
         utEelwQ/7GX8cildlebNpoXAR6C1KSRhU1Sbvysns9YgwGbqMWM7gZpmaRec+pIyYP5N
         10Udhod/JWm4dnlFUrADkiySmBjPf44a/Od4qlcXEu2rwuoFW2VgWMUjCkmhm4s9TSCL
         KJnlCiRKzQyKwHEHBCJBzyV+GE/c6g5ZgIfne4JMydNDa5EWTmmAd9CvrlC16n9VGqc9
         CZjA==
X-Forwarded-Encrypted: i=1; AKwUvBz/L7niIV7IdvaE8zqJB4C1LQ3f0TDbzOTUnOgTjltE+vLO/gX8WtsnbJ5A9f2O393X5B+JHoxPWPDEPep+ztUw/VSQeg==@lists.linux.dev
X-Gm-Message-State: AFuF++kA2epmI/qh1yyI5otSyFlAWRFEfVmjO6lOg39eLwnolLbeqB5r
	6pnOtv897DbRT0KOe/hH5gq3IMZDA5OOKL5wDiNvXYwjiPMZk3dJFqGnlPoupTZSrZSBeChOPsw
	GLYwG4HSU6PdXVwmt4kDT8v0hUpOiJvI=
X-Gm-Gg: AYBFou2SPh55eiaPttz/yiNCwtwYzQmGkXuk2htE6bf3XkOznMcOMOxpSVS9oj+7bWZ
	H0uSKyb752x9hKC1IqdxaeDPFDyyrOGz0Cf7PTeJivTj21N0opkuYiez/yDJI6zZI8N9Wo473dr
	1zEnYhMWsVZgk2Pz3V1sV0w8B+LHd2JmUxZ6OHrzbyxTAN0zE8VtsXXGS0TasAJ/tOpV9LGfk4b
	SLla3XlNZz1jqQBbBxzE31e1Po8g6D5q5DvP5d6C4wiT6JYQ4i0wObVHQpxaTQlvkg0+raMr3dG
	jYT/gc+Iy9MJCFD85BUby9JrsMHE7I6XgccUM6ur+u4eUaoF0gDQ38T5fXFNMBS0C8gSVj9fRtT
	k8WlQFhoEQzMrAPGrDlVGY+iJb656os/DXKLyA7YWRGDnSA==
X-Received: by 2002:a05:620a:2b41:b0:93a:463:1296 with SMTP id
 af79cd13be357-93bb77012a6mr512342585a.18.1789573887002; Wed, 16 Sep 2026
 08:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914155301.14499-1-tharitt97@gmail.com> <20260914161000.E3CD21F000FF@smtp.kernel.org>
In-Reply-To: <20260914161000.E3CD21F000FF@smtp.kernel.org>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 16 Sep 2026 22:51:14 +0700
X-Gm-Features: AcwNN1XHwQyBqLjDeQ7jaI6DM6CbzWrYOn3V2n8CNvXZZDMWJ0_m1PdaYmObsWE
Message-ID: <CACak8wMDhXTXkS6PAMCY1_SbvGK_v6YQBCZxBLJZY382JuKbiw@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Test partial KVM_CLEAR_DIRTY_LOG requests
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +/* Use the 2nd 64-page range to exercise a non-zero offset. */
> > +#define TEST_CLEAR_LOG_FIRST_PAGE    64
> > +#define TEST_CLEAR_LOG_NUM_PAGES     64
> > +#define TEST_CLEAR_LOG_BIT           1
> > +#define TEST_CLEAR_LOG_PAGE          (TEST_CLEAR_LOG_FIRST_PAGE + \
> > +                                      TEST_CLEAR_LOG_BIT)
> > +static void guest_code_clear_log(void)
> > +{
> > +     u64 addr =3D guest_test_virt_mem + TEST_CLEAR_LOG_PAGE * host_pag=
e_size;
> > +
> > +     while (true) {
> > +             vcpu_arch_put_guest(*(u64 *)addr, 1);
>
> [Severity: Medium]
> Will this result in an out-of-bounds guest memory access on architectures=
 where
> the host page size is larger than the guest page size?

Agreed.
The allocation is sized in guest pages, but the clear request and
guest write offset are expressed in host pages.
I'll fix this in v2 by starting with 3*64=3D192 host pages and
converting that count to guest pages before applying the allocation
adjustment.

> > +     kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
> > +     for (page =3D 0; page < host_num_pages; page++)
> > +             TEST_ASSERT(test_bit_le(page, bmap),
> > +                         "Page %lu should be dirty after INITIALLY_SET=
", page);
>
> [Severity: Medium]
> Does this assertion assume that KVM_DIRTY_LOG_INITIALLY_SET is always sup=
ported
> if KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is present?
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914155301.14=
499-1-tharitt97@gmail.com?part=3D1

Agreed.
I'll check for the KVM_DIRTY_LOG_INITIALLY_SET at the start of the
test, and skip the test if it is unavailable.
