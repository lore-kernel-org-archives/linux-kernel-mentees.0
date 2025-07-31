Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5643913AA3C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 04:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753935465; cv=none; b=qdmFRuSk+ab9HOo6Ujgxo9fDcn+u7hqF5hL4VTl5HqyDKZBsRdTcih5mobxukmGxQTwljbecFE9vTERXAnz4Zgd9eYQ49jtAjMM4RwY517aaL59+k7L0cdwV3Wj1atJvjjWixmpuG7TV8B1Gf3UJeODLOdlp9DxILJwOYFDe48A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753935465; c=relaxed/simple;
	bh=pdpEixiSJRKDUk41L0t+kqCsPtoW98MyTj96BdafVtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYQdcZaul+kw1cRSRRTseulxB825Rq8pIdF0SCPdx3gNQhGJxmgyVCY7grBiTdT+KZWOa8R7nTZKmvl7im6ofBt6ZclGSoE4s7civF9+rE1us37n0VxpMpGp+7dFEtS4edW+StcoKDVQ5VIoVCcXHLI5SmS/O7aNew+HHhNrbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgYas777; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgYas777"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-306db05b292so205047fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 21:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753935463; x=1754540263; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pdpEixiSJRKDUk41L0t+kqCsPtoW98MyTj96BdafVtY=;
        b=EgYas777+drh7BnNzZ5Vn+rrsQeQ5fO9KPVaZ1fgunv6G4Mo8TDL0GCCPwjszvJFej
         TIpmX5fY7rKzL8bNm1lpZWpN+d9XsxQEKz6MiA6cq90N9fK5XZq0vOhRDE1QbqztucE6
         TE6YecJRh+rZZKBFR7nu/Siqi4g+9rSwRvd0xr6ftuq4yL6KvwCt9ZOBz562hgHJ759o
         K+6nXtEk2HncvjzM3NfY5lBJk1VnqCRRQLYpOaDTbOnBxfUziUd+HYDGV3JSZ/JZMT6N
         gF2cW2wGeBWL049nKnbiMQD9sQPcX+XrhUGe/5GZAQESet22w2ZAdppUfoNx8klv8O/N
         U/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753935463; x=1754540263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdpEixiSJRKDUk41L0t+kqCsPtoW98MyTj96BdafVtY=;
        b=ifWnQOJx93HK6n0dMrueu2khzpn0V9X4vqLmfCtAgxSOMXWxz1JqbBe7qLeFz1ujBS
         XjbOsF89GVkhbgyHazmkSaZ/VkFK4w0nC+ZeK/TUhY/LeDMVuTpxatDOjPQqZtKflxGM
         gzVPGS0K2hMCFYSUEgPgvMMKCEf+1ZGwkpFc/XhOGZgk0oKWePfEUGK2CfE6FzaN8LYZ
         i1w8GstH1ZKcLaVZKl4YiAji71hRxZrrLK5oqm/JKBEh1pvKbzwterbW+WCNcTrbxaz3
         ItKl76eeOEOBGXqOc5L5wuU3G6IDtYsfsJYt51zpHwMlq6r57WRuBxv+/bcWNPwchY3l
         +zMw==
X-Forwarded-Encrypted: i=1; AJvYcCWlq5g5qPloKAjBHxuVRVn8HyxKcbx48KXfbPkCg+umHlNuwi3RRqdC7fqyR05QVsSbKbncVrm5cTbT30mWgjdxBLzltg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqh7fSNFyr+qmkbJXDDhKwhsMS+AdnBCjfGXHo3Yju5voYPpvu
	nLW8Rr5PZnEN9Z1+Pn9+wjmq5isNMNrR9dmN+cuQBXaIj/bUGecb5N4cyyE1ERIWB1iEjLoUdel
	51AeKrdsNd0tx8IQ0F9ddzH52G5AAujQ=
X-Gm-Gg: ASbGncuoWtVxMkPK6HfYPdTLq0E4vp4N36RWQzyYJm5Xo+eXAS9Bqh8M7673CrzIIij
	Bla+Zkil91Yl6r+dotdYdC2GQIomCIRtnvuoAYr2tKvXgIXkM1JhX4j06fRp4FCIrXTPgYAML4y
	eQE/t1ZpbnfVzDyB2fZCyTQYqxKgEiVE6p6+VwLDCpM4zIwvbgP1KTTKvB8RaR3r6YpHDLlYSp5
	7VQZtBD
X-Google-Smtp-Source: AGHT+IHGHUprxJYjV+kRocPkbQvoewipOuKFbEiAf0UVq1rv+6mWShZRWDaf0BeNggrmLEHVJb90j8/i5Mh8mUQttDI=
X-Received: by 2002:a05:6870:6b8a:b0:2ef:e245:c65a with SMTP id
 586e51a60fabf-30785d59ff3mr3598956fac.38.1753935463283; Wed, 30 Jul 2025
 21:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730042617.5620-1-suchitkarunakaran@gmail.com>
 <30f01900-e79f-4947-b0b4-c4ba29d18084@intel.com> <CAO9wTFhZjWsK27e28Gv2-QqMozns47EacOQfXtTdMfLjR98MTw@mail.gmail.com>
 <834f393e-8af9-4fc0-9ff4-23e7803e7eb6@intel.com> <CAO9wTFi6QZoZk2+TM--SeJLUsrYZXLeWkrfh1URXvRB=yWtwig@mail.gmail.com>
 <7590fe81-e771-42b3-b9fd-31ad3b7860bd@intel.com>
In-Reply-To: <7590fe81-e771-42b3-b9fd-31ad3b7860bd@intel.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 31 Jul 2025 09:47:32 +0530
X-Gm-Features: Ac12FXyT5v0dosvfmbsWOpS-j32vb71T9uRc3bfohW4BVHNq5uRKPNPQ98InyBg
Message-ID: <CAO9wTFgEeNBO9dkEyZe43fwg9NyZunzYtLNFCznom1-pqEXqVw@mail.gmail.com>
Subject: Re: [PATCH v3] x86/cpu/intel: Fix the constant_tsc model check for
 Pentium 4s
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	peterz@infradead.org, ravi.bangoria@amd.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Jul 2025 at 00:59, Sohil Mehta <sohil.mehta@intel.com> wrote:
>
> On 7/30/2025 9:27 AM, Suchit Karunakaran wrote:
> >
> > Alright. I will send v4 after the merge window closes. Thanks!
>
> Sending the patch sooner is fine, if you want. I meant it is likely to
> be picked up after the merge window has closed.

Yup got it.
