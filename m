Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A7326059D
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  6 Jul 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345857; cv=none; b=rdgWHDtYmbChghHtprjqiOeej59IeeZQx/DLC4RcelvQtYunE0Ru3k2ExQ07VO1fQO0msx/NnzbcVZuj+K6Hqk/J0dVtWIcqLDQjvdMb31usALUIxGaXKmG3hyJKRQPOefZBK2SRxHfTddW6SWte+MjahytcclLQjjuUkdVa49Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345857; c=relaxed/simple;
	bh=IgUdviJEsSFTVxZilVLZxpOnx1T2poIBfRVSuMDMnfY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=JAuMajxu/uBwZF/IByCf7ehrmxkfuQQ6xRs2fIzRr9IMQvQsWs/FE4zQmGHDfFT9LOKEP/Mjau5kd4vq+hnZbW+yVPzw8KdNy/xkr/sPgtPAuZagNxzDt41UROkYT/KGrOLnhX6EN6R55lDPTXh38jrxPLPsAr5Z2mjf1ySGKV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwYLvAnX; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwYLvAnX"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-73b909fbb6bso1890612137.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Jul 2026 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345855; x=1783950655; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rokkLcuskiz++BokjvjyUp6gnS9lDDUYlv8J+paANt0=;
        b=jwYLvAnXrVrfHs5TPivacLyaMFgFzzbikcXBOctnMQ63dURD6PjIqKTR8hllP7ttkL
         bfNt+LtuGuA7y8kzD22QZMMerm3/QfOvmX1JkyE5LGeIMPXRUsOHzI9jyJUNKimGymUg
         maw1/4NrZAFRknNbENBzP8w0gEkA4BIc2/Xrx3uIyi+RQJdp+3abf4RBh8F6CZwyIJW9
         nTJGCxFSaT7mFWbjnMnkEwBIM79lUYvqagKl+25pkAWUx1mpZ6hdAIarBofXh2Drq6gt
         l3KpY0wTX4/q8miUxvwPz4u9rPnrvxjpqw9Wtu91GDtWb4v44eTgHVdj2Ycl7drhntc7
         uKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345855; x=1783950655;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rokkLcuskiz++BokjvjyUp6gnS9lDDUYlv8J+paANt0=;
        b=IMniiKAotDvoMTJoLfBgfXQtscUYq94dHZsD2MhRLhSIqAU31Zql1dLYoZJfVGm5rC
         ViLMShC7LLq7hgUnp7txWsQ4RMx0DNYft2uIvsdbUBZ5Jxcqw5xwLs2oS6G2RwULAi6c
         oFgt7/DEMHSLcJtmDRoOQ0m0qOlfu6vmA/gzkq4QAack+tYW0VgpjCtHDj08AzTHPBLH
         ZduDEbdg+eS8X/tWI6FQuOzb2osk+UeasMxFwGE0OmPkFLcS1BPH1hgV7D7NHV/4ZoUO
         8thulDT1tRLLdRLWcicFqyt/9TGQju3xue2qdXGh+nDUZVBvRgr0Z+XDaEmveAWCkxuV
         Y2JA==
X-Forwarded-Encrypted: i=1; AHgh+RrIDWZGPCV/ixpBmC+IC8phNcu0/DlOBoSSvamWPaEg22e4bxcGlepLeZzrh3tusZhkJcd6Np1hWH8uEUL+vg8iUt7FYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNsIUulIj8NFeurc1JXCYMtfliatv2gq1dFMIbedydR/NnRI1d
	Ww7cboFxRi5N1fm4kJqAyPIv06bz6BOi5Z5vIzoWas6JvVLMawF2SkQ=
X-Gm-Gg: AfdE7cnTtRUWdLbTXLg8fAyHiz6R5MunFu64HKIJOmkxmrnIRRDBgLIvaD2SSPZCT/X
	nPWwQOyLcBs4Bd7ZpLdRpw1eKR7PE3DC4ZFnkeCF2vC8dnRPPtnUQ9cZ3p4mZfifNHKveK4eyHk
	QfFJrYyRzsTg+S6ZwkW0yw2nipNLgknk2/m6k11qCVYl9elEWmYbpEJZZVHtlbhKVrFeETq+tBJ
	jHqPuc5QWUrq3HSCmclge4NJ+bk6hK6VaETHWKyc6eRIsLTndBZ6PCOztwxTBMCv4w1++J0g+at
	jkBB1k8MIVLvrYCe75X4FewrKnQNAdiT3oe6A1HjREaDHx6z81TTLKmDUN+VmtJtB704iPh4Hvd
	lgqTUuWn/Jjjmz2p1Xq1qd5pPp9fbncYjTjOmm4UnN0l5D4NfxTTaJfE4HauwH3Qq3hksQoqSRo
	gob5vQ0kOqIeG8wmF/SHJgZ+n//TRSs+fwDo84MUBojydjfoxl
X-Received: by 2002:a05:6102:390c:b0:738:54e8:c101 with SMTP id ada2fe7eead31-744b7c8f42emr313140137.15.1783345854585;
        Mon, 06 Jul 2026 06:50:54 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96b3890d5bfsm3509015241.11.2026.07.06.06.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 10:50:47 -0300
Message-Id: <DJRJCCGCXYOL.2O4HP9N37SPAK@gmail.com>
Subject: Re: [PATCH] rust: i2c: avoid locking when calling
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, "Igor Korotin" <igor.korotin@linux.dev>
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
X-Mailer: aerc 0.20.0
References: <20260615201141.8920-1-nico.antinori.7@gmail.com>
 <DJBDWVUWH3OT.1GDEIJT0R4UTK@garyguo.net>
 <DJCA8F2F93US.1KMA54SKQ364K@gmail.com>
In-Reply-To: <DJCA8F2F93US.1KMA54SKQ364K@gmail.com>

Hello Gary,

On Thu Jun 18, 2026 at 12:32 PM -03, Nicol=C3=A1s Antinori wrote:
> Hello Gary,
>
> On Wed Jun 17, 2026 at 11:12 AM -03, Gary Guo wrote:
>> On Mon Jun 15, 2026 at 9:10 PM BST, Nicol=C3=A1s Antinori wrote:
>>> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
>>> index 624b971ca8b0..d89c42691dfe 100644
>>> --- a/rust/kernel/i2c.rs
>>> +++ b/rust/kernel/i2c.rs
>>> @@ -426,8 +426,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>>>  // SAFETY: Instances of `I2cAdapter` are always reference-counted.
>>>  unsafe impl AlwaysRefCounted for I2cAdapter {
>>>      fn inc_ref(&self) {
>>> -        // SAFETY: The existence of a shared reference guarantees that=
 the refcount is non-zero.
>>> -        unsafe { bindings::i2c_get_adapter(self.index()) };
>>> +        // SAFETY: The existence of a shared reference guarantees that=
 the refcounts are non-zero.
>>> +        unsafe {
>>> +            bindings::__module_get((*self.as_raw()).owner);
>>> +            bindings::get_device(&raw mut (*self.as_raw()).dev);
>>
>> Instead of open coding this sequence, it would be better to add a C API =
that
>> does exactly this (getting another reference from existing one).
>
> I based this solution on the logic used in I2cClient (where only
> get_device is needed) and by verifying which counters the C
> implementation (i2c_get_adapter) increments.
>
> The i2c_get_adapter function in i2c-core-base.c performs two increments
> (module increment is done by calling try_module_get, but in this case,
> because inc_ref operates on an already live instance, unconditionally=20
> incrementing the count with `__module_get` should be safe).
>
> If I understand correctly, the idea would be to introduce a helper=20
> function on the C side, for example:
> void i2c_adapter_increment(struct i2c_adap *adap);
>
> We would perform the increments there and call it from Rust. Using this=
=20
> in inc_ref would be safe because the existence of &self guarantees that=
=20
> we already have a valid, live instance.
>
> Is there any concern regarding this function beign exposed to the C
> side? To use it safely in C, callers would have to ensure that *adap
> points to a valid instance.

I tried implementing this with the following C helper:

...
void i2c_adapter_inc_ref(struct i2c_adapter *adapter)
{
	__module_get(adapter->owner);
	get_device(&adapter->dev);
}
...

Calling this from Rust results in much cleaner code. The function does=20
skips a NULL check for *adapter because the AlwaysRefCounted::inc_ref=20
signature suggest a non-fallibe operation. Did I understand your=20
suggestion correctly?

Also, does it make sense to declare a C API wrapper whose sole purpose
is to be called from the Rust side?

>
>>
>> That said, is there an actual user that needs this, or are we just imple=
menting
>> AlwaysRefCounted preemptively?
>
> The only user I could find at the moment is the example driver
> (impl platform::Driver for SampleDriver ..) in
> samples/rust/rust_i2c_client.rs.

Does it make sense to move forward with this patch since there are no
real users yet? Does the Sashiko diagnostic makes sense? Maybe I
misunderstood it and it does not apply.

Thank you!
Nicol=C3=A1s
