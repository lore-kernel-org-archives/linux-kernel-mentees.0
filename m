Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B5D376BC6
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780224925; cv=pass; b=CLcBlkOimmps/1kX2yZ0thZqsK7qNWYTONjlNPW+GfGykg5Z3GTwOtaoK5UlEfggjf2LstACoDZM1AjqcC7AwWBt3TtBiURURSQbbVmP/EycD8lMvcS4P4voNRSvhXuypo1tdwvzIKzKgXflDCMOEoIn0Q10eAKfYO1etGfvxhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780224925; c=relaxed/simple;
	bh=Nm0tmq5ULLWQNSJtXAjGCgBa0hYs9qgF5ZFGoPUTPQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/XeAC0C3oJoKyd+aC3bYGLBiBT1CY/QrmjkTp1+uHpIz9PQ9q+e4DATCdhsKlJ9+2TJfUJ42jiolP7DPoDCX94TT02CJkfuzt/hgEAajzPgwVqkbEzoF6HuRBQ9gX0yDP03LUm91Ef1SMNNxktr0rhOk8DFEay3XddmjTjQ82Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9bg81/4; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9bg81/4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa68dbd44fso291132e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 03:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780224922; cv=none;
        d=google.com; s=arc-20240605;
        b=KHqagm3jA/APmKD4Tk4hAnBS/mZVCLBPiWuf25F2XPvZqnQ88qoD2xTPzu+Pn+Jj7h
         +AQeAu6+dWoHePZWHZmrjZu5mm4NqguQrMSeKaNddTUe2YjCleKhgdANQMJd7TcAtVnd
         eQ55XcNC8uzNmpeLgBEGqwlDN79o6m/YGl1HehH1H9LUQnbZ4OnJrmqA+1kCiInLsEEg
         DeNUwPca+iM+4sc+kkUhhOhYVcWbEmgC0HjqanErWtQs44d8l1XYLwlTWkjxDFPzITx4
         OXqXirRfodaO1OWPsat54v/wlFeSPSacqK9TN+IhCwfEnaRHJ8Qzu/t+8VgFe4mI0fry
         gv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1093W6GwBbIGfmlyuBH18NfrL6utXJlkl45KlHg45Ho=;
        fh=y8R5l1UFOaN2k2+jWwPCrgAXWi+bAIpNhHQdhGH82Ng=;
        b=bFdmubCrrYcIsFxzsdQeDxuxCvO3RKPucGW11fU9fXlNyo1Jbz6DPaV5hVj3E/ox0q
         63FnyznAD1g+iX0GwGd7WH26rPW1MuKqHclJHBjehBOx8liCR+F02mSfGm5W+SaboQjY
         py0n1KrW7JAB3bOqFvD7uzmVk5JmwxgWq0umSZZab/My06AAhKsmBhGNDDmzueCy6iKG
         QEEELWE3LgpQ+kRvaXoXo2Z8CI1JsUi0dIdWXSUFRiYtGl0iiZED+Ce5hZqbC6sYolN3
         lnMkxmVEf7L1rJsoFtovFcsx00nlaC1yemtrUbLbKlqZiIezn9HI9f8WtwGk2wpzH444
         6Aig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780224922; x=1780829722; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1093W6GwBbIGfmlyuBH18NfrL6utXJlkl45KlHg45Ho=;
        b=G9bg81/45x1buuRc7rGfTm4BarK2k3MVG9GatgHYDjfSi8Debw7AIFWtorMxOq7P/W
         Vik6LMCWL2O6+tYEH6PxAICp8URAIwQT5uJ+s+QxJjN7YCvrvkJZhhuF1xWjOYssdLPa
         GON7JWNBnfYXrJFnabJYGxae0K2v+3NEYmb+ZDTh5IwIaxmLhb1tqkkCLuh0HWZDfgAd
         h4HmmW+Dk2Mj7PBtcHCtp8tNQexXsQXgHlnXh8Oeufw1W2WmcSUrgsNf73aqY8fD0n7K
         oVYLVKOCAukbC4fsp5MFgk1TMzewIScRx/1zspGIPITpW+4yqiYY6JhHc+OqJWKeTo8I
         8Ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780224922; x=1780829722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1093W6GwBbIGfmlyuBH18NfrL6utXJlkl45KlHg45Ho=;
        b=bTz66EkfGGtVQJAueC4Mq+7dIL/9/mx8ERMdbcN42mhkCZb2yJ93PC068w1z/1xd8W
         wX/QDO5WcgJXsO5lNq1xTbWhIdtsjNpKiJOzCmMAj/h2eDBey7r+mH7kzGdjDt6dHjhR
         vsbP9onEtki7d6kgWdi0s5DmizTwbgsdQwK5o9bE6lzp3idWN01VdCNjjEsri3JXy096
         5h5qOAAj1iGHzGfBMWjtPDZJz2G5P4Crgc9fKA0WXSyw/D8yqoj9epwwmnBnFkTlxMOq
         Guo9dLiahqnBy/XtiKEDFW1lhcNFl9+64XSfvuy95s/6Gp88a3xxKYhk2NJvfAZA11lU
         V3qQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0ARAcxH7sjGwMtDloJSMsjkyasEJ6GH3fkCHSCdSHqYoEhNaT8fcRrn1Zht7PwGmxYU4/WvUfofw+YOFxVZUwBzGFXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeAvDwmotpgZpa/MeM/hzNh6M4fVEtAE+ip0EHh16+qChBthcV
	aCz3shKFYNlOwkV2qDEnjVP5G3mMCNHUrjugKhudymUIw6CWgxiY72qgh2F/dmO3liekSPBrJtC
	1/s32qgFt6R/NjYEV2nDD9a1DcTCiX2frA1wq
X-Gm-Gg: Acq92OHBqJmQ7g3wdpK8rq3z713DRnA2XC/1J0fUbchib+qHbfFIiAmgWXnjjer9lAS
	0B7S3/Ba0ieraS4hujVot+gBdZ0KJ3PLHRrHoYSoJ7LO8t+7kb+ATaUz6tjATpxsGRsh9UZuBzo
	oUb35FabfCCdOn0kl0qDRmiDJOHVwx/DlHJzqdooEeRM7Szsfemkf6msJveC+Is7fBrI42Fk12E
	WmGGf76kfueVp89QN+9KRVPtk6s4VO8s3Fj9PK3yBPRWeyA3l2aAj83eUhCU0YURbdgrfwJQ4gd
	m+syR8REm7vYgL+xsOyq6bl3J2p93576p054qfN1jPfJ+WQDQg==
X-Received: by 2002:a05:6512:12c2:b0:5aa:6c27:c44e with SMTP id
 2adb3069b0e04-5aa6c27c552mr54641e87.22.1780224921700; Sun, 31 May 2026
 03:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-3-suunj1331@gmail.com>
 <CAHp75VeeAOnUj018z_JdSKZagXP7yYaw7okm0jdT8BBp_DM6iQ@mail.gmail.com>
In-Reply-To: <CAHp75VeeAOnUj018z_JdSKZagXP7yYaw7okm0jdT8BBp_DM6iQ@mail.gmail.com>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Sun, 31 May 2026 19:55:10 +0900
X-Gm-Features: AVHnY4I2Lr4axwE7KYByIRLLAi7ZshWau76NwjYsMhtD9kY8YK2GQ8Qs4a5SX5w
Message-ID: <CAGwK=3qzWZHaewUXyvmxEG8Ann=s9AButj=9+6LEobG+O09pgw@mail.gmail.com>
Subject: Re: [PATCH 2/4] iio: pressure: mpl3115: clean up interrupt handling
 and locking
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, apokusinski01@gmail.com, 
	me@brighamcampbell.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Sat, May 30, 2026 at 9:33 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> > Switch the trigger handler from explicit mutex_lock/unlock
> > to scoped_guard() for consistency with the locking style
> > used elsewhere in the driver.
>
> Split these two. Moving to scoped_guard() is a separate refactoring.

Will do. I'll move the scoped_guard() conversion to its own patch in
v2.

> > No functional change intended.
>
> But this is a lie. The change is a (big enough) functional change and
> actually it feels and sounds like it deserves a Fixes tag.

You're right, the IRQ_NONE change is a functional change. I'll split
it into its own patch with a Fixes tag and drop the "no functional
change" wording.

> > +reg1_cleanup:
> > +       i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> > +                                 data->ctrl_reg1);
>
> And if this fails?.. (Okay, this is not this patch issue, it's an
> original code.)

Right, that's pre-existing and outside the scope of this series.

> > Move mpl3115_config_interrupt() above the interrupt handler
> > in preparation for the FIFO support added in a subsequent
> > patch.
>
> If you need to move it up, split this move to a separate patch.

Will split the move into its own patch in v2.

Thanks for the review.

On Sat, May 30, 2026 at 9:33=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, May 30, 2026 at 1:40=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.co=
m> wrote:
> >
> > Return IRQ_NONE instead of IRQ_HANDLED when reading
> > INT_SOURCE fails.
> >
> > On shared interrupt lines, returning IRQ_HANDLED after a
> > failed register read may prevent other handlers from being
> > invoked.
>
> > Switch the trigger handler from explicit mutex_lock/unlock
> > to scoped_guard() for consistency with the locking style
> > used elsewhere in the driver.
>
> Split these two. Moving to scoped_guard() is a separate refactoring.
>
> > Move mpl3115_config_interrupt() above the interrupt handler
> > in preparation for the FIFO support added in a subsequent
> > patch.
>
> > No functional change intended.
>
> But this is a lie. The change is a (big enough) functional change and
> actually it feels and sounds like it deserves a Fixes tag.
>
> ...
>
> > +reg1_cleanup:
> > +       i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> > +                                 data->ctrl_reg1);
>
> And if this fails?.. (Okay, this is not this patch issue, it's an
> original code.)
>
> > +       return ret;
> > +}
>
> ...
>
> > -static int mpl3115_config_interrupt(struct mpl3115_data *data,
> > -                                   u8 ctrl_reg1, u8 ctrl_reg4)
> > -{
> > -       int ret;
> > -
> > -       ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_RE=
G1,
> > -                                       ctrl_reg1);
> > -       if (ret < 0)
> > -               return ret;
> > -
> > -       ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_RE=
G4,
> > -                                       ctrl_reg4);
> > -       if (ret < 0)
> > -               goto reg1_cleanup;
> > -
> > -       data->ctrl_reg1 =3D ctrl_reg1;
> > -       data->ctrl_reg4 =3D ctrl_reg4;
> > -
> > -       return 0;
> > -
> > -reg1_cleanup:
> > -       i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> > -                                 data->ctrl_reg1);
> > -       return ret;
> > -}
>
> If you need to move it up, split this move to a separate patch.
>
> --
> With Best Regards,
> Andy Shevchenko
