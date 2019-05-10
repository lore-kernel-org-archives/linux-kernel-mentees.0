From: lukas.bulwahn@gmail.com (Lukas Bulwahn)
Date: Fri, 10 May 2019 22:34:57 +0200
Subject: [Linux-kernel-mentees] [PATCH] Staging: kpc2000: kpc_dma:
 resolve checkpath errors and warnings
In-Reply-To: <20190510193833.1051-1-bnvandana@gmail.com>
References: <20190510193833.1051-1-bnvandana@gmail.com>
Message-ID:
 <CAKXUXMzJCmSZqJ+VFxEOgf_HNgKfPfKS7OECw_RzSxVrDZpCGw@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190510203457.1ipYip5Vn4kQe520oo0jf_0Wvt1bHZ7zUxhnvehN65M@z>

On Fri, May 10, 2019 at 9:39 PM Vandana BN <bnvandana at gmail.com> wrote:
>
> This patch resolves coding style errors and warnings reported by chechpatch
>

I did not look at the patch in detail, but you might want to also
consider to replace the CamlCase (function) names by names in
lower-case with underscores. That is the common style in the kernel.

Lukas
