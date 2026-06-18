Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C424C31F9AA
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Jun 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796762; cv=none; b=DoqieWN3cc6XSJXL/cKKUXQGT1S1aq2qEEJNTMOLDZGMaISWcOJTE+cFhTLNFfsis462Z0h49lepRGylfu8FWAKKSWk2c1OFwsBtfJHfmhnTuRcqEkBHbZHZpfOoykSFdLo7alfe9U+PLsJzI7nYtEEBExO9ku9sC797axCbB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796762; c=relaxed/simple;
	bh=kJtsp1IazgSMj1nbHUhrUJKr18wuS2KWcV03+qv/vOw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Gwcqb32a8mkVFiQdnm0uFL5cTQ09KufoJhF5UrLv8++dI80p7wFrOmYUpX+b4h6RxUTaogqNi/5D7i9Tz8YjpQtdfhnpjGwuvuobMHxpE3ogExLXVhjq7iobZ04Yh7FiITzNUDgH+wOly5uXqywctV9C3xu7rymEcp+s3xfLJfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evXU48KU; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evXU48KU"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137335bc3caso1613417c88.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Jun 2026 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781796759; x=1782401559; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP2Cpfm9UZ2KtOTUXD2ERtet4jXDhXqiOeuJJjteN/I=;
        b=evXU48KUIFLyOeLXtPm4nIhPYYZ6WUPNNsQ/7PjFMRfX3DwXOFHNxOJqwwq8aVkLsn
         T3+pynLnDbwB0F/h4g14dEaY3ED74oojTJUTt6sJiVWV7Ua+G8zK/gya8vu9BQefdBTu
         itPv2ObAgLMEY9TCvCviCdtxZkYDML+QQg5T8eOC0ltVlRTvSnyZXXOVJd4BDmvOIM/b
         f1HQ0cCjs1L2Dg139mJu75jjY2H8C3xfrQ9MfjWTcCfRr09HvnNh5tcwvBCoVIu8qxBm
         VrknEwKf7hRQ0gQCEhhci6L6/qOd+mX5IsQ/yAnpjuI6E3kvcgHyNdmq2LQc3WHB+iXu
         VTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781796759; x=1782401559;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZP2Cpfm9UZ2KtOTUXD2ERtet4jXDhXqiOeuJJjteN/I=;
        b=Sx0yWQrMFdCzQr7KndEdNg+usZ8oYgKViCI2Ti1ZOfYBgx/zfTnqjbdqv+aqqXZhDS
         xJrLEAk8fJwM/1p9NgFbhVKl8Dpr4EHlPgr6Actbh6wPOsyLhCl52dc9UY45urQlaCQw
         c8VhTpr4K0Iko4ILLhyerKGaviqmDdsmQb+bnimM1XCIOkv1o6QFGHGQH/57bJBTFAe4
         QYhUMZrXTzXZu+9Y3IKY/snxvUzBqy31qKUWWXtzWqpui4JSYZ2gVVj5fsvRkn/Qog7i
         lZRSuWiEVduvTD5kwIfeBgjDiOiaohZtApNZPCsJhp40IgXeFjJMlCfmseA+q/eN9Kuy
         11QA==
X-Forwarded-Encrypted: i=1; AFNElJ/v5Jwd4CBcQLF3Q0hiPyPOSS+ltbqf+6r1mgm+c2yv8q4qFFAN7hOuf6fWNb0Y8JbnQT4RGj7zEIZDbjLL8+W/WMo4nQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJTra2pjQrsjfblfDVmS9g8aQAL/5AwZ651MDh6nkm0vxlzSnq
	3KcPczg59BYikS9CnrAJwiOCLaKwplsJtUryPckDDVmtaYuGdfTlcTc=
X-Gm-Gg: AfdE7cmAOjFkU9R40fnObkcI1x9RynnQhFMwUH0uaM2rVBoe792AJeUhwJXZ8ffICqS
	1GGDHbrP8HMFC09ESS148V6+pXhzVFjsW247AfDada6wTpqy/ZQz4kr/M/jTzqJj4e4WcxO6qjU
	jJlTNAC4C+d57WwBVOQ25ElKStJ2QuEkVl3r2krnjgZBX5M+VhomwTAYM5MAIpVqIerWHknOljU
	znaOJJ4R9vrlKuSPJ8q1XJrVxG2nkiqNOjP4tJKe5yObzBp64+I+++xp7zTEP6ACuRhLaWjo2yd
	3goJvKxekuMCctvZKL+JsMxMIoz0pHkbdn+w7LS/priV8SMH1mXxMVquYEFoUhlZh8jYyLYqrzI
	42hmB1DEaLnNVx1pcCtyOPopwQM0omAEA0Ms4cBLu/X3OJSkxplJM4YzjUSZ2vPkcqSGNqIwb4R
	xJu7Mtzuiq6iwgQ/vcRgTf8pDXw6jx7v1G8oKSRpJiAvZP7K8N
X-Received: by 2002:a05:7022:69a3:b0:138:3613:dc6 with SMTP id a92af1059eb24-139a205f34bmr134839c88.14.1781796758001;
        Thu, 18 Jun 2026 08:32:38 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b964862sm19182868c88.10.2026.06.18.08.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 08:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 12:32:30 -0300
Message-Id: <DJCA8F2F93US.1KMA54SKQ364K@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel-mentees@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Sashiko"
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH] rust: i2c: avoid locking when calling
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Igor Korotin" <igor.korotin@linux.dev>
X-Mailer: aerc 0.20.0
References: <20260615201141.8920-1-nico.antinori.7@gmail.com>
 <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>
In-Reply-To: <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>

Hello Gary,

On Wed Jun 17, 2026 at 11:12 AM -03, Gary Guo wrote:
> On Mon Jun 15, 2026 at 9:10 PM BST, Nicol=C3=A1s Antinori wrote:
>> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
>> index 624b971ca8b0..d89c42691dfe 100644
>> --- a/rust/kernel/i2c.rs
>> +++ b/rust/kernel/i2c.rs
>> @@ -426,8 +426,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>>  // SAFETY: Instances of `I2cAdapter` are always reference-counted.
>>  unsafe impl AlwaysRefCounted for I2cAdapter {
>>      fn inc_ref(&self) {
>> -        // SAFETY: The existence of a shared reference guarantees that =
the refcount is non-zero.
>> -        unsafe { bindings::i2c_get_adapter(self.index()) };
>> +        // SAFETY: The existence of a shared reference guarantees that =
the refcounts are non-zero.
>> +        unsafe {
>> +            bindings::__module_get((*self.as_raw()).owner);
>> +            bindings::get_device(&raw mut (*self.as_raw()).dev);
>
> Instead of open coding this sequence, it would be better to add a C API t=
hat
> does exactly this (getting another reference from existing one).

I based this solution on the logic used in I2cClient (where only
get_device is needed) and by verifying which counters the C
implementation (i2c_get_adapter) increments.

The i2c_get_adapter function in i2c-core-base.c performs two increments
(module increment is done by calling try_module_get, but in this case,
because inc_ref operates on an already live instance, unconditionally=20
incrementing the count with `__module_get` should be safe).

If I understand correctly, the idea would be to introduce a helper=20
function on the C side, for example:
void i2c_adapter_increment(struct i2c_adap *adap);

We would perform the increments there and call it from Rust. Using this=20
in inc_ref would be safe because the existence of &self guarantees that=20
we already have a valid, live instance.

Is there any concern regarding this function beign exposed to the C
side? To use it safely in C, callers would have to ensure that *adap
points to a valid instance.

>
> That said, is there an actual user that needs this, or are we just implem=
enting
> AlwaysRefCounted preemptively?

The only user I could find at the moment is the example driver
(impl platform::Driver for SampleDriver ..) in
samples/rust/rust_i2c_client.rs.

Implementing AlwaysRefCounted is required for types wrapped in ARef,
which is an smart pointer that handles custom reference counting.
Since I2cAdapter::get returns an ARef<I2cAdapter> upon success, the=20
trait must be implemented.

Thank you!

>
> Best,
> Gary
>
>> +        }
>>      }
>>
>>      unsafe fn dec_ref(obj: NonNull<Self>) {
>> --
>> 2.47.3

