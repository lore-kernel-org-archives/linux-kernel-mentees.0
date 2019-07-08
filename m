From: andy.shevchenko at gmail.com (Andy Shevchenko)
Date: Mon, 8 Jul 2019 11:02:29 +0300
Subject: [Linux-kernel-mentees] [PATCH] cs5535: use BIT() macro for
	defining bit-flags
In-Reply-To: <20190707113016.GA30635@arch>
References: <20190707113016.GA30635@arch>
Message-ID: <CAHp75VfceRDnuRtdD_mR6mMZF_LH7u1ptPRXiA=DUfgTGebCPA@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sun, Jul 7, 2019 at 2:30 PM Amol Surati <suratiamol at gmail.com> wrote:
>
> The BIT() macro is available for defining the required bit-flags.

Shouldn't bits.h be added?

> Since it operates on an unsigned value and expands to an unsigned result,
> using it, instead of an expression like (1 << x), also fixes the problem
> of shifting a signed 32-bit value by 31 bits. (e.g. 1 << 31. See
> CS5536_GPIOM7_PME_FLAG and CS5536_GPIOM7_PME_EN).

What problem?
You need to describe that (UB by the standard, though gcc works fine,
I never heard it utilizes such).

-- 
With Best Regards,
Andy Shevchenko
