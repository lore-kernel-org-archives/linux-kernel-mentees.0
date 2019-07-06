From: rafael@kernel.org (Rafael J. Wysocki)
Date: Sat, 6 Jul 2019 09:58:40 +0200
Subject: [Linux-kernel-mentees] [PATCH] Documentation: cpu-freq: Convert
	core.txt file to ReST format
In-Reply-To: <20190705210428.8039-1-shreeya.patel23498@gmail.com>
References: <20190705210428.8039-1-shreeya.patel23498@gmail.com>
Message-ID:
 <CAJZ5v0hovK+BY0kozGvkyCgR5CFHpZUu71BZRjUUdCYV8fM5Hg@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190706075840.Hta1-o73USSjGp4Pa-BU5KLGUZLENAG7YkT2ZFyOmI4@z>

On Fri, Jul 5, 2019 at 11:04 PM Shreeya Patel
<shreeya.patel23498 at gmail.com> wrote:
>
> Convert core file to ReST format, in order to allow it to
> be parsed by Sphinx. Make a minor change of correcting the wrong
> function name cpufreq_put_cpu to cpufreq_cpu_put.
> Also create an index.rst file in cpu-freq and add it's entry
> in the main Documentation/index.rst file.
>
> Signed-off-by: Shreeya Patel <shreeya.patel23498 at gmail.com>

I've said "no" no three previous attempts and this one is not different.

I don't want to have anything .rst in Documentation/cpu-freq/.

There is a *new* admin-guide doc for cpufreq already and what is
missing is a *new* driver-api one.

Thanks!
